; DESCRIPTION: Creates a red rectangular region at (156, 97) spanning 46 by 62 pixels.
; PLAN: r0=156(x), r1=97(y), r2=46(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 97
LDI r2, 46
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
