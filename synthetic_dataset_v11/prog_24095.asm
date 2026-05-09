; DESCRIPTION: Creates a red rectangular region at (157, 71) spanning 84 by 74 pixels.
; PLAN: r0=157(x), r1=71(y), r2=84(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 71
LDI r2, 84
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
