; DESCRIPTION: Composite: Draws a red line from (248, 104) to (307, 221) then Creates a magenta circular shape at (421, 229) with radius 11.
; PLAN: r0=248(x1), r1=104(y1), r2=307(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=421(x), r6=229(y), r7=11(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 248
LDI r1, 104
LDI r2, 307
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 229
LDI r7, 11
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
