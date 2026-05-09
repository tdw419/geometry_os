; DESCRIPTION: Creates a magenta rectangular region at (122, 180) spanning 51 by 75 pixels.
; PLAN: r0=122(x), r1=180(y), r2=51(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 180
LDI r2, 51
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
