; DESCRIPTION: Creates a magenta rectangular region at (66, 137) spanning 111 by 116 pixels.
; PLAN: r0=66(x), r1=137(y), r2=111(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 137
LDI r2, 111
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
