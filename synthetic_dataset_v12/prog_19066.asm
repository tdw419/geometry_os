; DESCRIPTION: Composite: Places a purple dot at position (21, 96) then Creates a purple rectangular region at (325, 116) spanning 25 by 101 pixels.
; PLAN: r0=21(x), r1=96(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=325(x), r6=116(y), r7=25(width), r8=101(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 21
LDI r1, 96
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 325
LDI r6, 116
LDI r7, 25
LDI r8, 101
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
