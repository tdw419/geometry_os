; DESCRIPTION: Creates a black rectangular region at (264, 200) spanning 27 by 15 pixels.
; PLAN: r0=264(x), r1=200(y), r2=27(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 200
LDI r2, 27
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
