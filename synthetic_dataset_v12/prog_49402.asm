; DESCRIPTION: Creates a black rectangular region at (433, 201) spanning 65 by 21 pixels.
; PLAN: r0=433(x), r1=201(y), r2=65(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 201
LDI r2, 65
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
