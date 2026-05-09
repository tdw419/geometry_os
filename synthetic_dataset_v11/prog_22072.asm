; DESCRIPTION: Creates a red rectangular region at (63, 64) spanning 99 by 28 pixels.
; PLAN: r0=63(x), r1=64(y), r2=99(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 64
LDI r2, 99
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
