; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (79, 68) spanning 90 by 107 pixels. Then Places a orange dot at position (131, 116).
; PLAN: r0=79(x), r1=68(y), r2=90(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=131(x), r1=116(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a cyan rectangular region at (79, 68) spanning 90 by 107 pixels.
; PLAN: r0=79(x), r1=68(y), r2=90(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 68
LDI r2, 90
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (131, 116).
; PLAN: r0=131(x), r1=116(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 116
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
