; DESCRIPTION: Creates a yellow rectangular region at (167, 97) spanning 84 by 79 pixels.
; PLAN: r0=167(x), r1=97(y), r2=84(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 97
LDI r2, 84
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
