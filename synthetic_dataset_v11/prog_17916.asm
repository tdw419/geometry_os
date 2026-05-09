; DESCRIPTION: Composite: . Then Renders a cyan box of size 115x119 starting at (57, 53). Then Draws a blue line from (192, 74) to (235, 107).
; PLAN: r0=57(x), r1=53(y), r2=115(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=192(x1), r1=74(y1), r2=235(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan box of size 115x119 starting at (57, 53).
; PLAN: r0=57(x), r1=53(y), r2=115(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 53
LDI r2, 115
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue line from (192, 74) to (235, 107).
; PLAN: r0=192(x1), r1=74(y1), r2=235(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 74
LDI r2, 235
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
