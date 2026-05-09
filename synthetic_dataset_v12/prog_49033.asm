; DESCRIPTION: Creates a cyan rectangular region at (414, 31) spanning 16 by 116 pixels.
; PLAN: r0=414(x), r1=31(y), r2=16(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 31
LDI r2, 16
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
