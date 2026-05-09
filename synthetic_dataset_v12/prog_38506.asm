; DESCRIPTION: Creates a black rectangular region at (453, 159) spanning 25 by 55 pixels.
; PLAN: r0=453(x), r1=159(y), r2=25(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 159
LDI r2, 25
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
