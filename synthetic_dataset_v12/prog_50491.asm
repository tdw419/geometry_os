; DESCRIPTION: Creates a cyan rectangular region at (179, 113) spanning 86 by 116 pixels.
; PLAN: r0=179(x), r1=113(y), r2=86(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 113
LDI r2, 86
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
