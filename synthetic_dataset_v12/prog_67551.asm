; DESCRIPTION: Creates a red rectangular region at (69, 101) spanning 86 by 89 pixels.
; PLAN: r0=69(x), r1=101(y), r2=86(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 101
LDI r2, 86
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
