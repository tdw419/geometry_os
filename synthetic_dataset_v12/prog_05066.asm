; DESCRIPTION: Creates a magenta rectangular region at (457, 187) spanning 11 by 24 pixels.
; PLAN: r0=457(x), r1=187(y), r2=11(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 187
LDI r2, 11
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
