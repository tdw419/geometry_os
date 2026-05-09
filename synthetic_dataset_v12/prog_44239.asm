; DESCRIPTION: Creates a red rectangular region at (328, 128) spanning 105 by 58 pixels.
; PLAN: r0=328(x), r1=128(y), r2=105(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 128
LDI r2, 105
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
