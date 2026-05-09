; DESCRIPTION: Creates a black rectangular region at (52, 83) spanning 68 by 48 pixels.
; PLAN: r0=52(x), r1=83(y), r2=68(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 83
LDI r2, 68
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
