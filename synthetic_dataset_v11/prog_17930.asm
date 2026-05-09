; DESCRIPTION: Creates a magenta rectangular region at (55, 35) spanning 120 by 53 pixels.
; PLAN: r0=55(x), r1=35(y), r2=120(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 35
LDI r2, 120
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
