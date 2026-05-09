; DESCRIPTION: Creates a magenta rectangular region at (161, 51) spanning 82 by 21 pixels.
; PLAN: r0=161(x), r1=51(y), r2=82(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 51
LDI r2, 82
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
