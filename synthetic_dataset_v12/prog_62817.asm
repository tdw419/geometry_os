; DESCRIPTION: Creates a cyan rectangular region at (141, 86) spanning 48 by 87 pixels.
; PLAN: r0=141(x), r1=86(y), r2=48(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 86
LDI r2, 48
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
