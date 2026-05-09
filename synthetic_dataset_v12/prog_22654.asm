; DESCRIPTION: Composite: Places a orange line segment connecting (494, 166) to (269, 128) then Draws a cyan circle centered at (79, 167) with radius 56.
; PLAN: r0=494(x1), r1=166(y1), r2=269(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=79(x), r6=167(y), r7=56(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 494
LDI r1, 166
LDI r2, 269
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 167
LDI r7, 56
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
