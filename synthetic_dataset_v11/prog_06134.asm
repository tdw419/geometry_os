; DESCRIPTION: Composite: . Then Renders a white box of size 18x51 starting at (168, 136). Then Renders a purple line between points (203, 183) and (215, 179).
; PLAN: r0=168(x), r1=136(y), r2=18(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=203(x1), r1=183(y1), r2=215(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white box of size 18x51 starting at (168, 136).
; PLAN: r0=168(x), r1=136(y), r2=18(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 136
LDI r2, 18
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple line between points (203, 183) and (215, 179).
; PLAN: r0=203(x1), r1=183(y1), r2=215(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 183
LDI r2, 215
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
