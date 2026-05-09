; DESCRIPTION: Creates a red rectangular region at (477, 13) spanning 16 by 88 pixels.
; PLAN: r0=477(x), r1=13(y), r2=16(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 13
LDI r2, 16
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
