; DESCRIPTION: Composite: . Then Draws a blue rectangle at (30, 2) with width 53 and height 95. Then Places a purple line segment connecting (125, 73) to (235, 39).
; PLAN: r0=30(x), r1=2(y), r2=53(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=125(x1), r1=73(y1), r2=235(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue rectangle at (30, 2) with width 53 and height 95.
; PLAN: r0=30(x), r1=2(y), r2=53(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 2
LDI r2, 53
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple line segment connecting (125, 73) to (235, 39).
; PLAN: r0=125(x1), r1=73(y1), r2=235(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 73
LDI r2, 235
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
