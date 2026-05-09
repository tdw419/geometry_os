; DESCRIPTION: Creates a red rectangular region at (249, 156) spanning 11 by 24 pixels.
; PLAN: r0=249(x), r1=156(y), r2=11(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 156
LDI r2, 11
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
