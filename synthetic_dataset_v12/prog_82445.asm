; DESCRIPTION: Creates a purple rectangular region at (336, 184) spanning 94 by 36 pixels.
; PLAN: r0=336(x), r1=184(y), r2=94(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 184
LDI r2, 94
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
