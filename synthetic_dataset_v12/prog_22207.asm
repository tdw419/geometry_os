; DESCRIPTION: Creates a cyan rectangular region at (116, 141) spanning 48 by 47 pixels.
; PLAN: r0=116(x), r1=141(y), r2=48(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 141
LDI r2, 48
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
