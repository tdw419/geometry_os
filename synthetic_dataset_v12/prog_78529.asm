; DESCRIPTION: Creates a black rectangular region at (52, 170) spanning 24 by 50 pixels.
; PLAN: r0=52(x), r1=170(y), r2=24(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 170
LDI r2, 24
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
