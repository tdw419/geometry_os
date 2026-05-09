; DESCRIPTION: Creates a magenta rectangular region at (296, 58) spanning 51 by 119 pixels.
; PLAN: r0=296(x), r1=58(y), r2=51(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 58
LDI r2, 51
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
