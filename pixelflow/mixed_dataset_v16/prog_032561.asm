; DESCRIPTION: Creates a magenta rectangular region at (130, 142) spanning 102 by 106 pixels.
; PLAN: r0=130(x), r1=142(y), r2=102(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 142
LDI r2, 102
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
