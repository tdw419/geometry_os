; DESCRIPTION: Creates a magenta rectangular region at (168, 106) spanning 81 by 80 pixels.
; PLAN: r0=168(x), r1=106(y), r2=81(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 106
LDI r2, 81
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
