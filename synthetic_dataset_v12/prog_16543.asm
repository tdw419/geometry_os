; DESCRIPTION: Creates a black rectangular region at (88, 107) spanning 50 by 97 pixels.
; PLAN: r0=88(x), r1=107(y), r2=50(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 107
LDI r2, 50
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
