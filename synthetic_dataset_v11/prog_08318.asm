; DESCRIPTION: Creates a black rectangular region at (87, 209) spanning 62 by 25 pixels.
; PLAN: r0=87(x), r1=209(y), r2=62(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 209
LDI r2, 62
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
