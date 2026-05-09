; DESCRIPTION: Creates a red rectangular region at (246, 23) spanning 97 by 37 pixels.
; PLAN: r0=246(x), r1=23(y), r2=97(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 23
LDI r2, 97
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
