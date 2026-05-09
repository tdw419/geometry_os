; DESCRIPTION: Creates a magenta rectangular region at (33, 35) spanning 50 by 116 pixels.
; PLAN: r0=33(x), r1=35(y), r2=50(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 35
LDI r2, 50
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
