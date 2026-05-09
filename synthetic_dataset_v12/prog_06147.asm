; DESCRIPTION: Creates a black rectangular region at (340, 36) spanning 106 by 54 pixels.
; PLAN: r0=340(x), r1=36(y), r2=106(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 36
LDI r2, 106
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
