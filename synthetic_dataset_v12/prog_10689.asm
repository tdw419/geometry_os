; DESCRIPTION: Creates a black rectangular region at (52, 48) spanning 75 by 83 pixels.
; PLAN: r0=52(x), r1=48(y), r2=75(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 48
LDI r2, 75
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
