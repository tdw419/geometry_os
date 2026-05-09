; DESCRIPTION: Creates a magenta rectangular region at (48, 44) spanning 115 by 44 pixels.
; PLAN: r0=48(x), r1=44(y), r2=115(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 44
LDI r2, 115
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
