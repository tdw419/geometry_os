; DESCRIPTION: Creates a cyan rectangular region at (116, 138) spanning 40 by 79 pixels.
; PLAN: r0=116(x), r1=138(y), r2=40(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 138
LDI r2, 40
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
