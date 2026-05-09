; DESCRIPTION: Creates a red rectangular region at (309, 132) spanning 34 by 58 pixels.
; PLAN: r0=309(x), r1=132(y), r2=34(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 132
LDI r2, 34
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
