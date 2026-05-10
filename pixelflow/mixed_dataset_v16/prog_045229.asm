; DESCRIPTION: Composite: Places a magenta line segment connecting (221, 64) to (251, 34) then Renders a blue disk with center (412, 154) and radius 51.
; PLAN: r0=221(x1), r1=64(y1), r2=251(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=412(x), r6=154(y), r7=51(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 221
LDI r1, 64
LDI r2, 251
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 154
LDI r7, 51
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
