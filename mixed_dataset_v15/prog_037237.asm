; DESCRIPTION: Composite: Places a orange dot at position (151, 206) then Creates a purple rectangular region at (319, 157) spanning 56 by 55 pixels.
; PLAN: r0=151(x), r1=206(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=319(x), r6=157(y), r7=56(width), r8=55(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 151
LDI r1, 206
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 319
LDI r6, 157
LDI r7, 56
LDI r8, 55
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
