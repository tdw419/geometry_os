; DESCRIPTION: Creates a cyan rectangular region at (128, 10) spanning 64 by 114 pixels.
; PLAN: r0=128(x), r1=10(y), r2=64(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 10
LDI r2, 64
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
