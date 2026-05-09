; DESCRIPTION: Composite: Draws a magenta line from (316, 130) to (197, 103) then Places a red circle of radius 36 at center (51, 118).
; PLAN: r0=316(x1), r1=130(y1), r2=197(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=51(x), r6=118(y), r7=36(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 316
LDI r1, 130
LDI r2, 197
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 118
LDI r7, 36
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
