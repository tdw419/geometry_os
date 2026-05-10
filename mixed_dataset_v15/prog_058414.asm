; DESCRIPTION: Creates a magenta rectangular region at (265, 69) spanning 111 by 108 pixels.
; PLAN: r0=265(x), r1=69(y), r2=111(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 69
LDI r2, 111
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
