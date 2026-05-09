; DESCRIPTION: Creates a cyan rectangular region at (21, 126) spanning 73 by 116 pixels.
; PLAN: r0=21(x), r1=126(y), r2=73(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 126
LDI r2, 73
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
