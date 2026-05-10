; DESCRIPTION: Creates a magenta rectangular region at (30, 140) spanning 69 by 113 pixels.
; PLAN: r0=30(x), r1=140(y), r2=69(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 140
LDI r2, 69
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
