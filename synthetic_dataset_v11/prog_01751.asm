; DESCRIPTION: Creates a magenta rectangular region at (68, 116) spanning 111 by 118 pixels.
; PLAN: r0=68(x), r1=116(y), r2=111(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 116
LDI r2, 111
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
