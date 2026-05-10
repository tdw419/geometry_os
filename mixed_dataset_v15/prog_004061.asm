; DESCRIPTION: Creates a black rectangular region at (159, 147) spanning 86 by 37 pixels.
; PLAN: r0=159(x), r1=147(y), r2=86(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 147
LDI r2, 86
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
