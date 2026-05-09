; DESCRIPTION: Creates a magenta rectangular region at (140, 171) spanning 44 by 62 pixels.
; PLAN: r0=140(x), r1=171(y), r2=44(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 171
LDI r2, 44
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
