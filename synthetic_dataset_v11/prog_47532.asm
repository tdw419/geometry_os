; DESCRIPTION: Creates a magenta rectangular region at (124, 69) spanning 72 by 72 pixels.
; PLAN: r0=124(x), r1=69(y), r2=72(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 69
LDI r2, 72
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
