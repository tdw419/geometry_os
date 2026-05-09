; DESCRIPTION: Creates a magenta rectangular region at (236, 58) spanning 108 by 114 pixels.
; PLAN: r0=236(x), r1=58(y), r2=108(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 58
LDI r2, 108
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
