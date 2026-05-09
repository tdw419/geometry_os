; DESCRIPTION: Creates a magenta rectangular region at (403, 126) spanning 69 by 51 pixels.
; PLAN: r0=403(x), r1=126(y), r2=69(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 126
LDI r2, 69
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
