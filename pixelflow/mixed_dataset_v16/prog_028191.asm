; DESCRIPTION: Creates a black rectangular region at (430, 44) spanning 54 by 63 pixels.
; PLAN: r0=430(x), r1=44(y), r2=54(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 44
LDI r2, 54
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
