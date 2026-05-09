; DESCRIPTION: Creates a red rectangular region at (155, 16) spanning 34 by 36 pixels.
; PLAN: r0=155(x), r1=16(y), r2=34(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 16
LDI r2, 34
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
