; DESCRIPTION: Creates a red rectangular region at (137, 56) spanning 23 by 107 pixels.
; PLAN: r0=137(x), r1=56(y), r2=23(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 56
LDI r2, 23
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
