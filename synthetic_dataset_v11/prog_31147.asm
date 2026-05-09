; DESCRIPTION: Creates a yellow rectangular region at (64, 12) spanning 71 by 36 pixels.
; PLAN: r0=64(x), r1=12(y), r2=71(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 12
LDI r2, 71
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
