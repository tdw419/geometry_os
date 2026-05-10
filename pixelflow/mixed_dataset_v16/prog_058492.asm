; DESCRIPTION: Creates a red rectangular region at (73, 84) spanning 74 by 97 pixels.
; PLAN: r0=73(x), r1=84(y), r2=74(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 84
LDI r2, 74
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
