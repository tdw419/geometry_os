; DESCRIPTION: Creates a black rectangular region at (20, 54) spanning 23 by 52 pixels.
; PLAN: r0=20(x), r1=54(y), r2=23(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 54
LDI r2, 23
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
