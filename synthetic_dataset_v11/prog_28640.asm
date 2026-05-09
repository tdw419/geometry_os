; DESCRIPTION: Creates a magenta rectangular region at (160, 179) spanning 37 by 41 pixels.
; PLAN: r0=160(x), r1=179(y), r2=37(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 179
LDI r2, 37
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
