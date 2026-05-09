; DESCRIPTION: Creates a black rectangular region at (333, 148) spanning 110 by 22 pixels.
; PLAN: r0=333(x), r1=148(y), r2=110(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 148
LDI r2, 110
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
