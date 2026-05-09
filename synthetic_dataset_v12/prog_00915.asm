; DESCRIPTION: Creates a magenta rectangular region at (332, 186) spanning 114 by 58 pixels.
; PLAN: r0=332(x), r1=186(y), r2=114(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 186
LDI r2, 114
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
