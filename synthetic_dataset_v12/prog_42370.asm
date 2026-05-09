; DESCRIPTION: Creates a magenta rectangular region at (63, 70) spanning 41 by 26 pixels.
; PLAN: r0=63(x), r1=70(y), r2=41(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 70
LDI r2, 41
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
