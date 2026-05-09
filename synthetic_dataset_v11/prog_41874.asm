; DESCRIPTION: Creates a magenta rectangular region at (26, 51) spanning 96 by 117 pixels.
; PLAN: r0=26(x), r1=51(y), r2=96(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 51
LDI r2, 96
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
