; DESCRIPTION: Creates a black rectangular region at (83, 80) spanning 45 by 25 pixels.
; PLAN: r0=83(x), r1=80(y), r2=45(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 80
LDI r2, 45
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
