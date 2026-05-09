; DESCRIPTION: Creates a magenta rectangular region at (341, 55) spanning 25 by 112 pixels.
; PLAN: r0=341(x), r1=55(y), r2=25(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 55
LDI r2, 25
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
