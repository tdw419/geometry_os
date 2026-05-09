; DESCRIPTION: Creates a cyan rectangular region at (189, 123) spanning 56 by 27 pixels.
; PLAN: r0=189(x), r1=123(y), r2=56(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 123
LDI r2, 56
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
