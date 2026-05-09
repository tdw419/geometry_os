; DESCRIPTION: Creates a red rectangular region at (184, 94) spanning 67 by 101 pixels.
; PLAN: r0=184(x), r1=94(y), r2=67(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 94
LDI r2, 67
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
