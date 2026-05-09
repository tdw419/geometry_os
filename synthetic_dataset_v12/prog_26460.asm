; DESCRIPTION: Creates a magenta rectangular region at (336, 184) spanning 106 by 48 pixels.
; PLAN: r0=336(x), r1=184(y), r2=106(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 184
LDI r2, 106
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
