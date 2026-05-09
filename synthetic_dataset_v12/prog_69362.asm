; DESCRIPTION: Creates a cyan rectangular region at (124, 56) spanning 64 by 108 pixels.
; PLAN: r0=124(x), r1=56(y), r2=64(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 56
LDI r2, 64
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
