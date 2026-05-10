; DESCRIPTION: Creates a black rectangular region at (24, 33) spanning 104 by 91 pixels.
; PLAN: r0=24(x), r1=33(y), r2=104(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 33
LDI r2, 104
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
