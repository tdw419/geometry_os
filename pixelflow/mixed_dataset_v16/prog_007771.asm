; DESCRIPTION: Creates a black rectangular region at (185, 117) spanning 19 by 79 pixels.
; PLAN: r0=185(x), r1=117(y), r2=19(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 117
LDI r2, 19
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
