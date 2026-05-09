; DESCRIPTION: Creates a red rectangular region at (297, 156) spanning 83 by 97 pixels.
; PLAN: r0=297(x), r1=156(y), r2=83(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 156
LDI r2, 83
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
