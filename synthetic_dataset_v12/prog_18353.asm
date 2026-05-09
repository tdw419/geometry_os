; DESCRIPTION: Creates a black rectangular region at (101, 209) spanning 63 by 31 pixels.
; PLAN: r0=101(x), r1=209(y), r2=63(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 209
LDI r2, 63
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
