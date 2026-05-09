; DESCRIPTION: Creates a yellow rectangular region at (209, 128) spanning 12 by 96 pixels.
; PLAN: r0=209(x), r1=128(y), r2=12(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 128
LDI r2, 12
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
