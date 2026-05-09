; DESCRIPTION: Creates a yellow rectangular region at (100, 64) spanning 63 by 71 pixels.
; PLAN: r0=100(x), r1=64(y), r2=63(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 64
LDI r2, 63
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
