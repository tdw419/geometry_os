; DESCRIPTION: Creates a magenta rectangular region at (159, 77) spanning 51 by 67 pixels.
; PLAN: r0=159(x), r1=77(y), r2=51(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 77
LDI r2, 51
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
