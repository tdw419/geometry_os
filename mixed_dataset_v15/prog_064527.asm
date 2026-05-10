; DESCRIPTION: Creates a black rectangular region at (321, 164) spanning 74 by 52 pixels.
; PLAN: r0=321(x), r1=164(y), r2=74(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 164
LDI r2, 74
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
