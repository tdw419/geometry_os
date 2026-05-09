; DESCRIPTION: Creates a red rectangular region at (128, 165) spanning 107 by 88 pixels.
; PLAN: r0=128(x), r1=165(y), r2=107(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 165
LDI r2, 107
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
