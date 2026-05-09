; DESCRIPTION: Creates a red rectangular region at (9, 101) spanning 39 by 12 pixels.
; PLAN: r0=9(x), r1=101(y), r2=39(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 101
LDI r2, 39
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
