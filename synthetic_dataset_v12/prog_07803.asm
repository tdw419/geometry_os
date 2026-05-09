; DESCRIPTION: Composite: Places a yellow line segment connecting (383, 247) to (356, 167) then Places a magenta circle of radius 61 at center (225, 102).
; PLAN: r0=383(x1), r1=247(y1), r2=356(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=225(x), r6=102(y), r7=61(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 383
LDI r1, 247
LDI r2, 356
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 102
LDI r7, 61
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
