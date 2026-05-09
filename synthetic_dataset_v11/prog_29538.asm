; DESCRIPTION: Creates a cyan rectangular region at (83, 206) spanning 93 by 26 pixels.
; PLAN: r0=83(x), r1=206(y), r2=93(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 206
LDI r2, 93
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
