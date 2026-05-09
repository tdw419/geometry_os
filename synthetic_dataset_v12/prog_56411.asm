; DESCRIPTION: Creates a magenta rectangular region at (280, 51) spanning 34 by 60 pixels.
; PLAN: r0=280(x), r1=51(y), r2=34(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 51
LDI r2, 34
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
