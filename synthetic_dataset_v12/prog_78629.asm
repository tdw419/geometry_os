; DESCRIPTION: Creates a red rectangular region at (184, 155) spanning 101 by 44 pixels.
; PLAN: r0=184(x), r1=155(y), r2=101(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 155
LDI r2, 101
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
