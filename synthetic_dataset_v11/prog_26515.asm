; DESCRIPTION: Creates a magenta rectangular region at (41, 86) spanning 65 by 109 pixels.
; PLAN: r0=41(x), r1=86(y), r2=65(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 86
LDI r2, 65
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
