; DESCRIPTION: Creates a magenta rectangular region at (23, 44) spanning 115 by 93 pixels.
; PLAN: r0=23(x), r1=44(y), r2=115(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 44
LDI r2, 115
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
