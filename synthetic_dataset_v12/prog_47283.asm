; DESCRIPTION: Creates a black rectangular region at (430, 79) spanning 11 by 111 pixels.
; PLAN: r0=430(x), r1=79(y), r2=11(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 79
LDI r2, 11
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
