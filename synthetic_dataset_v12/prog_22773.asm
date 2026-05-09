; DESCRIPTION: Creates a red rectangular region at (291, 56) spanning 23 by 99 pixels.
; PLAN: r0=291(x), r1=56(y), r2=23(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 56
LDI r2, 23
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
