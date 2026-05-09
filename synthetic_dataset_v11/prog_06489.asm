; DESCRIPTION: Creates a magenta rectangular region at (51, 103) spanning 108 by 58 pixels.
; PLAN: r0=51(x), r1=103(y), r2=108(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 103
LDI r2, 108
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
