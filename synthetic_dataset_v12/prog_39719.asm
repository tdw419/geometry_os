; DESCRIPTION: Creates a cyan rectangular region at (275, 106) spanning 116 by 107 pixels.
; PLAN: r0=275(x), r1=106(y), r2=116(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 106
LDI r2, 116
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
