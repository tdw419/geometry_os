; DESCRIPTION: Creates a magenta rectangular region at (103, 97) spanning 107 by 87 pixels.
; PLAN: r0=103(x), r1=97(y), r2=107(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 97
LDI r2, 107
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
