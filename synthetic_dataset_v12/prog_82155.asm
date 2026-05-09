; DESCRIPTION: Creates a magenta rectangular region at (179, 140) spanning 72 by 18 pixels.
; PLAN: r0=179(x), r1=140(y), r2=72(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 140
LDI r2, 72
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
