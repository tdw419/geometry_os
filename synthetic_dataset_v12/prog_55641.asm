; DESCRIPTION: Creates a black rectangular region at (440, 132) spanning 40 by 55 pixels.
; PLAN: r0=440(x), r1=132(y), r2=40(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 132
LDI r2, 40
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
