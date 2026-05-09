; DESCRIPTION: Creates a red rectangular region at (144, 52) spanning 99 by 71 pixels.
; PLAN: r0=144(x), r1=52(y), r2=99(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 52
LDI r2, 99
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
