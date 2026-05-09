; DESCRIPTION: Composite: . Then Draws a black line from (110, 152) to (242, 50). Then Renders a blue box of size 120x12 starting at (35, 2).
; PLAN: r0=110(x1), r1=152(y1), r2=242(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=35(x), r1=2(y), r2=120(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (110, 152) to (242, 50).
; PLAN: r0=110(x1), r1=152(y1), r2=242(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 152
LDI r2, 242
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue box of size 120x12 starting at (35, 2).
; PLAN: r0=35(x), r1=2(y), r2=120(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 2
LDI r2, 120
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
