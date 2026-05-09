; DESCRIPTION: Creates a red rectangular region at (72, 156) spanning 15 by 58 pixels.
; PLAN: r0=72(x), r1=156(y), r2=15(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 156
LDI r2, 15
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
