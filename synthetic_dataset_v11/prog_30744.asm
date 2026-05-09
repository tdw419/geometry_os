; DESCRIPTION: Creates a red rectangular region at (98, 132) spanning 75 by 41 pixels.
; PLAN: r0=98(x), r1=132(y), r2=75(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 132
LDI r2, 75
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
