; DESCRIPTION: Creates a red rectangular region at (128, 122) spanning 59 by 52 pixels.
; PLAN: r0=128(x), r1=122(y), r2=59(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 122
LDI r2, 59
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
