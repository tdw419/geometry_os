; DESCRIPTION: Creates a magenta rectangular region at (180, 153) spanning 96 by 43 pixels.
; PLAN: r0=180(x), r1=153(y), r2=96(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 153
LDI r2, 96
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
