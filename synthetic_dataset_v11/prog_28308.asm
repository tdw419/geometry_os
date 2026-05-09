; DESCRIPTION: Creates a magenta rectangular region at (111, 138) spanning 107 by 100 pixels.
; PLAN: r0=111(x), r1=138(y), r2=107(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 138
LDI r2, 107
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
