; DESCRIPTION: Creates a black rectangular region at (252, 84) spanning 75 by 50 pixels.
; PLAN: r0=252(x), r1=84(y), r2=75(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 84
LDI r2, 75
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
