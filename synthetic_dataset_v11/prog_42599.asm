; DESCRIPTION: Creates a magenta rectangular region at (156, 138) spanning 84 by 26 pixels.
; PLAN: r0=156(x), r1=138(y), r2=84(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 138
LDI r2, 84
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
