; DESCRIPTION: Composite: Places a white line segment connecting (326, 6) to (302, 173) then Places a magenta circle of radius 57 at center (186, 191) then Places a black dot at position (218, 78).
; PLAN: r0=326(x1), r1=6(y1), r2=302(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=186(x), r6=191(y), r7=57(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=218(x), r11=78(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 326
LDI r1, 6
LDI r2, 302
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 191
LDI r7, 57
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 218
LDI r11, 78
LDI r12, 0x000000
PSET r10, r11, r12
HALT
