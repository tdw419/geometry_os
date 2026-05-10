; DESCRIPTION: Composite: Sets a single red pixel at (132, 44) then Creates a purple rectangular region at (144, 74) spanning 86 by 24 pixels.
; PLAN: r0=132(x), r1=44(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=144(x), r6=74(y), r7=86(width), r8=24(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 132
LDI r1, 44
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 144
LDI r6, 74
LDI r7, 86
LDI r8, 24
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
