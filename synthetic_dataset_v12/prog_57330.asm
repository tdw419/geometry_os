; DESCRIPTION: Creates a black rectangular region at (433, 161) spanning 56 by 33 pixels.
; PLAN: r0=433(x), r1=161(y), r2=56(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 161
LDI r2, 56
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
