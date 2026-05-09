; DESCRIPTION: Creates a cyan rectangular region at (353, 44) spanning 116 by 81 pixels.
; PLAN: r0=353(x), r1=44(y), r2=116(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 44
LDI r2, 116
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
