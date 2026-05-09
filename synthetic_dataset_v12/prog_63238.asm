; DESCRIPTION: Creates a magenta rectangular region at (87, 164) spanning 97 by 34 pixels.
; PLAN: r0=87(x), r1=164(y), r2=97(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 164
LDI r2, 97
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
