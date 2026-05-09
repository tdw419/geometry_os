; DESCRIPTION: Composite: . Then Renders a orange box of size 87x88 starting at (4, 50). Then Draws a green line from (6, 20) to (124, 2).
; PLAN: r0=4(x), r1=50(y), r2=87(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=6(x1), r1=20(y1), r2=124(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange box of size 87x88 starting at (4, 50).
; PLAN: r0=4(x), r1=50(y), r2=87(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 50
LDI r2, 87
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (6, 20) to (124, 2).
; PLAN: r0=6(x1), r1=20(y1), r2=124(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 20
LDI r2, 124
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
