; DESCRIPTION: Creates a red rectangular region at (290, 128) spanning 88 by 61 pixels.
; PLAN: r0=290(x), r1=128(y), r2=88(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 128
LDI r2, 88
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
