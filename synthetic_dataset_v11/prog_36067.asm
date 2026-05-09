; DESCRIPTION: Creates a yellow rectangular region at (184, 19) spanning 24 by 57 pixels.
; PLAN: r0=184(x), r1=19(y), r2=24(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 19
LDI r2, 24
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
