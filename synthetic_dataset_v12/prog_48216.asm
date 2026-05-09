; DESCRIPTION: Creates a black rectangular region at (199, 91) spanning 11 by 79 pixels.
; PLAN: r0=199(x), r1=91(y), r2=11(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 91
LDI r2, 11
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
