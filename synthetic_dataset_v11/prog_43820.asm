; DESCRIPTION: Creates a yellow rectangular region at (184, 199) spanning 36 by 56 pixels.
; PLAN: r0=184(x), r1=199(y), r2=36(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 199
LDI r2, 36
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
