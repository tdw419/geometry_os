; DESCRIPTION: Creates a magenta rectangular region at (233, 20) spanning 114 by 120 pixels.
; PLAN: r0=233(x), r1=20(y), r2=114(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 20
LDI r2, 114
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
