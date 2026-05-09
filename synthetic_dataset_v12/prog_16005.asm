; DESCRIPTION: Creates a magenta rectangular region at (44, 114) spanning 75 by 82 pixels.
; PLAN: r0=44(x), r1=114(y), r2=75(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 114
LDI r2, 75
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
