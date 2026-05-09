; DESCRIPTION: Composite: Places a magenta dot at position (244, 9) then Creates a magenta rectangular region at (393, 173) spanning 79 by 49 pixels.
; PLAN: r0=244(x), r1=9(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=393(x), r6=173(y), r7=79(width), r8=49(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 9
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 393
LDI r6, 173
LDI r7, 79
LDI r8, 49
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
