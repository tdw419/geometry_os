; DESCRIPTION: Creates a red rectangular region at (200, 140) spanning 62 by 29 pixels.
; PLAN: r0=200(x), r1=140(y), r2=62(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 140
LDI r2, 62
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
