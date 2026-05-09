; DESCRIPTION: Creates a magenta rectangular region at (139, 130) spanning 69 by 72 pixels.
; PLAN: r0=139(x), r1=130(y), r2=69(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 130
LDI r2, 69
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
