; DESCRIPTION: Creates a red rectangular region at (475, 109) spanning 21 by 101 pixels.
; PLAN: r0=475(x), r1=109(y), r2=21(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 109
LDI r2, 21
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
