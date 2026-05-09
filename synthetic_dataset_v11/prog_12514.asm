; DESCRIPTION: Creates a magenta rectangular region at (140, 131) spanning 79 by 28 pixels.
; PLAN: r0=140(x), r1=131(y), r2=79(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 131
LDI r2, 79
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
