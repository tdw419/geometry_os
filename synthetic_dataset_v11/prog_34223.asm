; DESCRIPTION: Creates a magenta rectangular region at (221, 41) spanning 23 by 44 pixels.
; PLAN: r0=221(x), r1=41(y), r2=23(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 41
LDI r2, 23
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
