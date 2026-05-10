; DESCRIPTION: Creates a magenta rectangular region at (66, 119) spanning 107 by 111 pixels.
; PLAN: r0=66(x), r1=119(y), r2=107(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 119
LDI r2, 107
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
