; DESCRIPTION: Composite: . Then Draws a purple line from (35, 10) to (32, 179). Then Renders a black box of size 16x62 starting at (5, 52).
; PLAN: r0=35(x1), r1=10(y1), r2=32(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=5(x), r1=52(y), r2=16(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple line from (35, 10) to (32, 179).
; PLAN: r0=35(x1), r1=10(y1), r2=32(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 10
LDI r2, 32
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black box of size 16x62 starting at (5, 52).
; PLAN: r0=5(x), r1=52(y), r2=16(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 52
LDI r2, 16
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
