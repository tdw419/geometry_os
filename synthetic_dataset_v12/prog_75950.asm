; DESCRIPTION: Composite: Places a purple dot at position (176, 131) then Creates a black rectangular region at (17, 144) spanning 23 by 24 pixels.
; PLAN: r0=176(x), r1=131(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=17(x), r6=144(y), r7=23(width), r8=24(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 131
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 17
LDI r6, 144
LDI r7, 23
LDI r8, 24
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
