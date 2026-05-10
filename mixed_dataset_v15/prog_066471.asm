; DESCRIPTION: Composite: Sets a single purple pixel at (321, 14) then Renders a green line between points (214, 206) and (237, 6) then Creates a cyan circular shape at (177, 131) with radius 56.
; PLAN: r0=321(x), r1=14(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=214(x1), r6=206(y1), r7=237(x2), r8=6(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=177(x), r11=131(y), r12=56(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 321
LDI r1, 14
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 214
LDI r6, 206
LDI r7, 237
LDI r8, 6
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 177
LDI r11, 131
LDI r12, 56
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
