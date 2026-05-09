; DESCRIPTION: Creates a magenta rectangular region at (411, 81) spanning 48 by 12 pixels.
; PLAN: r0=411(x), r1=81(y), r2=48(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 81
LDI r2, 48
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
