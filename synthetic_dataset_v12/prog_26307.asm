; DESCRIPTION: Composite: Draws a cyan line from (505, 53) to (174, 218) then Creates a green circular shape at (440, 145) with radius 32.
; PLAN: r0=505(x1), r1=53(y1), r2=174(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=440(x), r6=145(y), r7=32(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 505
LDI r1, 53
LDI r2, 174
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 145
LDI r7, 32
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
