; DESCRIPTION: Creates a magenta rectangular region at (302, 56) spanning 112 by 93 pixels.
; PLAN: r0=302(x), r1=56(y), r2=112(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 56
LDI r2, 112
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
