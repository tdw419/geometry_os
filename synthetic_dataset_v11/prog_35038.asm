; DESCRIPTION: Creates a cyan rectangular region at (123, 52) spanning 82 by 116 pixels.
; PLAN: r0=123(x), r1=52(y), r2=82(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 52
LDI r2, 82
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
