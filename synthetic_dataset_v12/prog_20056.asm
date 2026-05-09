; DESCRIPTION: Creates a magenta rectangular region at (101, 73) spanning 71 by 25 pixels.
; PLAN: r0=101(x), r1=73(y), r2=71(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 73
LDI r2, 71
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
