; DESCRIPTION: Creates a red rectangular region at (122, 14) spanning 103 by 22 pixels.
; PLAN: r0=122(x), r1=14(y), r2=103(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 14
LDI r2, 103
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
