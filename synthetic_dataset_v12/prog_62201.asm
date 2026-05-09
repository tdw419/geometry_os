; DESCRIPTION: Composite: Places a purple circle of radius 68 at center (312, 78) then Renders a magenta box of size 31x66 starting at (116, 10) then Places a cyan dot at position (94, 218).
; PLAN: r0=312(x), r1=78(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=116(x), r6=10(y), r7=31(width), r8=66(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=94(x), r11=218(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 312
LDI r1, 78
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 116
LDI r6, 10
LDI r7, 31
LDI r8, 66
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 94
LDI r11, 218
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
