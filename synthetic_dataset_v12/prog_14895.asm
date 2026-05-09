; DESCRIPTION: Creates a magenta rectangular region at (252, 119) spanning 30 by 107 pixels.
; PLAN: r0=252(x), r1=119(y), r2=30(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 119
LDI r2, 30
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
