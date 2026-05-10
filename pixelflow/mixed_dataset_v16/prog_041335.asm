; DESCRIPTION: Creates a magenta rectangular region at (302, 51) spanning 10 by 39 pixels.
; PLAN: r0=302(x), r1=51(y), r2=10(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 51
LDI r2, 10
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
