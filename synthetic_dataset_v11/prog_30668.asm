; DESCRIPTION: Composite: . Then Renders a purple disk with center (56, 171) and radius 36. Then Draws a white line from (237, 166) to (103, 151).
; PLAN: r0=56(x), r1=171(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=237(x1), r1=166(y1), r2=103(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (56, 171) and radius 36.
; PLAN: r0=56(x), r1=171(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 171
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white line from (237, 166) to (103, 151).
; PLAN: r0=237(x1), r1=166(y1), r2=103(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 166
LDI r2, 103
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
