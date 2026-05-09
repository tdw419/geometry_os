; DESCRIPTION: Composite: Places a purple dot at position (219, 35) then Creates a magenta rectangular region at (232, 79) spanning 82 by 64 pixels.
; PLAN: r0=219(x), r1=35(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=232(x), r6=79(y), r7=82(width), r8=64(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 219
LDI r1, 35
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 232
LDI r6, 79
LDI r7, 82
LDI r8, 64
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
