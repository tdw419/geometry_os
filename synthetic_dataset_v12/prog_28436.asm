; DESCRIPTION: Creates a magenta rectangular region at (322, 120) spanning 73 by 118 pixels.
; PLAN: r0=322(x), r1=120(y), r2=73(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 120
LDI r2, 73
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
