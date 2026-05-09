; DESCRIPTION: Creates a cyan rectangular region at (289, 44) spanning 119 by 114 pixels.
; PLAN: r0=289(x), r1=44(y), r2=119(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 44
LDI r2, 119
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
