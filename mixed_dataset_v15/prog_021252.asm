; DESCRIPTION: Creates a cyan rectangular region at (280, 123) spanning 64 by 95 pixels.
; PLAN: r0=280(x), r1=123(y), r2=64(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 123
LDI r2, 64
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
