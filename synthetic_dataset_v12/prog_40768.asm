; DESCRIPTION: Creates a black rectangular region at (400, 97) spanning 38 by 91 pixels.
; PLAN: r0=400(x), r1=97(y), r2=38(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 97
LDI r2, 38
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
