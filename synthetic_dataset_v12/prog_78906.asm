; DESCRIPTION: Creates a magenta rectangular region at (382, 72) spanning 95 by 43 pixels.
; PLAN: r0=382(x), r1=72(y), r2=95(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 72
LDI r2, 95
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
