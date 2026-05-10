; DESCRIPTION: Creates a red rectangular region at (99, 132) spanning 64 by 88 pixels.
; PLAN: r0=99(x), r1=132(y), r2=64(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 132
LDI r2, 64
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
