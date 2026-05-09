; DESCRIPTION: Composite: . Then Renders a black line between points (16, 17) and (209, 180). Then Renders a blue box of size 86x70 starting at (110, 149).
; PLAN: r0=16(x1), r1=17(y1), r2=209(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=110(x), r1=149(y), r2=86(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black line between points (16, 17) and (209, 180).
; PLAN: r0=16(x1), r1=17(y1), r2=209(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 17
LDI r2, 209
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue box of size 86x70 starting at (110, 149).
; PLAN: r0=110(x), r1=149(y), r2=86(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 149
LDI r2, 86
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
