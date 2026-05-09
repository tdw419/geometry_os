; DESCRIPTION: Creates a cyan rectangular region at (93, 48) spanning 97 by 39 pixels.
; PLAN: r0=93(x), r1=48(y), r2=97(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 48
LDI r2, 97
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
