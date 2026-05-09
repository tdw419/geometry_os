; DESCRIPTION: Creates a magenta rectangular region at (35, 138) spanning 99 by 59 pixels.
; PLAN: r0=35(x), r1=138(y), r2=99(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 138
LDI r2, 99
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
