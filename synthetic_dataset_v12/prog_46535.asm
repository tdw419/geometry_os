; DESCRIPTION: Creates a black rectangular region at (264, 9) spanning 28 by 49 pixels.
; PLAN: r0=264(x), r1=9(y), r2=28(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 9
LDI r2, 28
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
