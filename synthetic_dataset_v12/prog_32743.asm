; DESCRIPTION: Creates a magenta rectangular region at (193, 89) spanning 91 by 53 pixels.
; PLAN: r0=193(x), r1=89(y), r2=91(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 89
LDI r2, 91
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
