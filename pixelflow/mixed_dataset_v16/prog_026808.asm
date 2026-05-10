; DESCRIPTION: Creates a cyan rectangular region at (133, 76) spanning 39 by 93 pixels.
; PLAN: r0=133(x), r1=76(y), r2=39(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 76
LDI r2, 39
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
