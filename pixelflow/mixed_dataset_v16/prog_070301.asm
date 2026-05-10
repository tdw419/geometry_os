; DESCRIPTION: Composite: Renders a red disk with center (247, 107) and radius 70 then Places a blue 118x89 rectangle at position (260, 143) then Sets a single purple pixel at (241, 54).
; PLAN: r0=247(x), r1=107(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x), r6=143(y), r7=118(width), r8=89(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=241(x), r11=54(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 247
LDI r1, 107
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 143
LDI r7, 118
LDI r8, 89
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 241
LDI r11, 54
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
