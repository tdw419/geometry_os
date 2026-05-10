; DESCRIPTION: Composite: Places a magenta circle of radius 32 at center (417, 164) then Renders a magenta line between points (447, 175) and (297, 185).
; PLAN: r0=417(x), r1=164(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=447(x1), r6=175(y1), r7=297(x2), r8=185(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 417
LDI r1, 164
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 447
LDI r6, 175
LDI r7, 297
LDI r8, 185
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
