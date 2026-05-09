; DESCRIPTION: Creates a cyan rectangular region at (76, 48) spanning 48 by 94 pixels.
; PLAN: r0=76(x), r1=48(y), r2=48(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 48
LDI r2, 48
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
