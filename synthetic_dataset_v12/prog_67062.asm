; DESCRIPTION: Composite: Places a cyan line segment connecting (241, 92) to (502, 171) then Draws a magenta circle centered at (52, 156) with radius 19.
; PLAN: r0=241(x1), r1=92(y1), r2=502(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=52(x), r6=156(y), r7=19(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 241
LDI r1, 92
LDI r2, 502
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 156
LDI r7, 19
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
