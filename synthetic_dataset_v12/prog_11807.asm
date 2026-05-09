; DESCRIPTION: Creates a cyan rectangular region at (289, 8) spanning 32 by 70 pixels.
; PLAN: r0=289(x), r1=8(y), r2=32(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 8
LDI r2, 32
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
