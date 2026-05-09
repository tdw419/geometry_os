; DESCRIPTION: Composite: Places a cyan line segment connecting (122, 205) to (55, 72) then Creates a magenta circular shape at (388, 61) with radius 61.
; PLAN: r0=122(x1), r1=205(y1), r2=55(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=61(y), r7=61(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 122
LDI r1, 205
LDI r2, 55
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 61
LDI r7, 61
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
