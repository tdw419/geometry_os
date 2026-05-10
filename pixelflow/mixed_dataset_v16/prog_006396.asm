; DESCRIPTION: Creates a magenta rectangular region at (225, 114) spanning 107 by 62 pixels.
; PLAN: r0=225(x), r1=114(y), r2=107(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 114
LDI r2, 107
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
