; DESCRIPTION: Creates a magenta rectangular region at (159, 25) spanning 11 by 97 pixels.
; PLAN: r0=159(x), r1=25(y), r2=11(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 25
LDI r2, 11
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
