; DESCRIPTION: Creates a magenta rectangular region at (233, 230) spanning 96 by 25 pixels.
; PLAN: r0=233(x), r1=230(y), r2=96(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 230
LDI r2, 96
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
