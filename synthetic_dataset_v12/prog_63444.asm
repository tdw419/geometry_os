; DESCRIPTION: Creates a cyan rectangular region at (139, 71) spanning 93 by 108 pixels.
; PLAN: r0=139(x), r1=71(y), r2=93(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 71
LDI r2, 93
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
