; DESCRIPTION: Creates a magenta rectangular region at (149, 241) spanning 93 by 15 pixels.
; PLAN: r0=149(x), r1=241(y), r2=93(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 241
LDI r2, 93
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
