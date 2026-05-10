; DESCRIPTION: Composite: Creates a cyan rectangular region at (339, 63) spanning 51 by 106 pixels then Places a red circle of radius 48 at center (277, 172) then Sets a single purple pixel at (458, 111).
; PLAN: r0=339(x), r1=63(y), r2=51(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x), r6=172(y), r7=48(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=458(x), r11=111(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 339
LDI r1, 63
LDI r2, 51
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 172
LDI r7, 48
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 458
LDI r11, 111
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
