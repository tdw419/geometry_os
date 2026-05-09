; DESCRIPTION: Creates a magenta rectangular region at (354, 153) spanning 105 by 97 pixels.
; PLAN: r0=354(x), r1=153(y), r2=105(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 153
LDI r2, 105
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
