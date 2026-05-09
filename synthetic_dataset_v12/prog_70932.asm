; DESCRIPTION: Creates a black rectangular region at (91, 45) spanning 107 by 30 pixels.
; PLAN: r0=91(x), r1=45(y), r2=107(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 45
LDI r2, 107
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
