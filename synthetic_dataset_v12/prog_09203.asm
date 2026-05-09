; DESCRIPTION: Creates a red rectangular region at (314, 209) spanning 101 by 28 pixels.
; PLAN: r0=314(x), r1=209(y), r2=101(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 209
LDI r2, 101
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
