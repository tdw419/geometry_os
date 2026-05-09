; DESCRIPTION: Creates a cyan rectangular region at (193, 58) spanning 116 by 116 pixels.
; PLAN: r0=193(x), r1=58(y), r2=116(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 58
LDI r2, 116
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
