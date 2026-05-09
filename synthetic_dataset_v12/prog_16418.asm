; DESCRIPTION: Creates a magenta rectangular region at (424, 137) spanning 48 by 105 pixels.
; PLAN: r0=424(x), r1=137(y), r2=48(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 137
LDI r2, 48
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
