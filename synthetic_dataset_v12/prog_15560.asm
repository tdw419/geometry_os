; DESCRIPTION: Creates a magenta rectangular region at (228, 157) spanning 101 by 26 pixels.
; PLAN: r0=228(x), r1=157(y), r2=101(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 157
LDI r2, 101
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
