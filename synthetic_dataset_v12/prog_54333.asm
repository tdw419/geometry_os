; DESCRIPTION: Creates a red rectangular region at (93, 192) spanning 84 by 52 pixels.
; PLAN: r0=93(x), r1=192(y), r2=84(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 192
LDI r2, 84
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
