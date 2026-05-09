; DESCRIPTION: Composite: Places a magenta circle of radius 67 at center (301, 147) then Places a cyan line segment connecting (322, 182) to (235, 69) then Places a red dot at position (139, 196).
; PLAN: r0=301(x), r1=147(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x1), r6=182(y1), r7=235(x2), r8=69(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=139(x), r11=196(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 301
LDI r1, 147
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 182
LDI r7, 235
LDI r8, 69
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 139
LDI r11, 196
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
