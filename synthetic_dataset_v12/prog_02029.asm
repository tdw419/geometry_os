; DESCRIPTION: Composite: Renders a magenta disk with center (111, 81) and radius 61 then Places a white line segment connecting (148, 15) to (0, 153).
; PLAN: r0=111(x), r1=81(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=148(x1), r6=15(y1), r7=0(x2), r8=153(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 111
LDI r1, 81
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 148
LDI r6, 15
LDI r7, 0
LDI r8, 153
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
