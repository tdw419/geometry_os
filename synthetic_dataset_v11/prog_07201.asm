; DESCRIPTION: Creates a yellow rectangular region at (12, 64) spanning 105 by 30 pixels.
; PLAN: r0=12(x), r1=64(y), r2=105(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 64
LDI r2, 105
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
