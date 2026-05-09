; DESCRIPTION: Creates a magenta rectangular region at (164, 51) spanning 47 by 57 pixels.
; PLAN: r0=164(x), r1=51(y), r2=47(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 51
LDI r2, 47
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
