; DESCRIPTION: Creates a black rectangular region at (339, 152) spanning 91 by 54 pixels.
; PLAN: r0=339(x), r1=152(y), r2=91(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 152
LDI r2, 91
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
