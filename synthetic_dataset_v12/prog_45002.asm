; DESCRIPTION: Creates a magenta rectangular region at (82, 200) spanning 78 by 51 pixels.
; PLAN: r0=82(x), r1=200(y), r2=78(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 200
LDI r2, 78
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
