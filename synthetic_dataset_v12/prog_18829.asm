; DESCRIPTION: Creates a magenta rectangular region at (49, 69) spanning 59 by 82 pixels.
; PLAN: r0=49(x), r1=69(y), r2=59(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 69
LDI r2, 59
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
