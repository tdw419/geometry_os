; DESCRIPTION: Creates a black rectangular region at (160, 125) spanning 63 by 51 pixels.
; PLAN: r0=160(x), r1=125(y), r2=63(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 125
LDI r2, 63
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
