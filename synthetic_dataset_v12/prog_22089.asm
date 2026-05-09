; DESCRIPTION: Composite: Sets a single cyan pixel at (322, 58) then Places a cyan line segment connecting (233, 243) to (249, 29) then Places a magenta circle of radius 68 at center (251, 108).
; PLAN: r0=322(x), r1=58(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=233(x1), r6=243(y1), r7=249(x2), r8=29(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=251(x), r11=108(y), r12=68(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 322
LDI r1, 58
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 233
LDI r6, 243
LDI r7, 249
LDI r8, 29
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 251
LDI r11, 108
LDI r12, 68
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
