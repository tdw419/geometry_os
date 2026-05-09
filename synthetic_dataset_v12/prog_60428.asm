; DESCRIPTION: Creates a black rectangular region at (350, 122) spanning 85 by 95 pixels.
; PLAN: r0=350(x), r1=122(y), r2=85(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 122
LDI r2, 85
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
