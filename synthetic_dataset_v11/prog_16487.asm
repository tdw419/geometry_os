; DESCRIPTION: Creates a black rectangular region at (19, 91) spanning 50 by 65 pixels.
; PLAN: r0=19(x), r1=91(y), r2=50(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 91
LDI r2, 50
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
