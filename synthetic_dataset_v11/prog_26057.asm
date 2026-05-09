; DESCRIPTION: Composite: . Then Places a black line segment connecting (168, 17) to (180, 178). Then Draws a purple rectangle at (30, 81) with width 55 and height 16.
; PLAN: r0=168(x1), r1=17(y1), r2=180(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=30(x), r1=81(y), r2=55(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black line segment connecting (168, 17) to (180, 178).
; PLAN: r0=168(x1), r1=17(y1), r2=180(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 17
LDI r2, 180
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple rectangle at (30, 81) with width 55 and height 16.
; PLAN: r0=30(x), r1=81(y), r2=55(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 81
LDI r2, 55
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
