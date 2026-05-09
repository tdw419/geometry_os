; DESCRIPTION: Creates a cyan rectangular region at (93, 124) spanning 17 by 116 pixels.
; PLAN: r0=93(x), r1=124(y), r2=17(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 124
LDI r2, 17
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
