; DESCRIPTION: Composite: . Then Draws a magenta line from (30, 230) to (51, 61). Then Draws a white circle centered at (204, 176) with radius 48.
; PLAN: r0=30(x1), r1=230(y1), r2=51(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=204(x), r1=176(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta line from (30, 230) to (51, 61).
; PLAN: r0=30(x1), r1=230(y1), r2=51(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 230
LDI r2, 51
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white circle centered at (204, 176) with radius 48.
; PLAN: r0=204(x), r1=176(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 176
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
