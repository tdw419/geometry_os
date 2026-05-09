; DESCRIPTION: Creates a cyan rectangular region at (131, 56) spanning 56 by 99 pixels.
; PLAN: r0=131(x), r1=56(y), r2=56(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 56
LDI r2, 56
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
