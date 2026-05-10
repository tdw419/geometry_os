; DESCRIPTION: Creates a cyan rectangular region at (93, 25) spanning 88 by 73 pixels.
; PLAN: r0=93(x), r1=25(y), r2=88(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 25
LDI r2, 88
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
