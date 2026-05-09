; DESCRIPTION: Composite: Places a magenta dot at position (93, 36) then Places a black 60x65 rectangle at position (417, 49) then Places a cyan circle of radius 36 at center (197, 185).
; PLAN: r0=93(x), r1=36(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=417(x), r6=49(y), r7=60(width), r8=65(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=197(x), r11=185(y), r12=36(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 93
LDI r1, 36
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 417
LDI r6, 49
LDI r7, 60
LDI r8, 65
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 197
LDI r11, 185
LDI r12, 36
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
