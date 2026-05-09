; DESCRIPTION: Creates a yellow rectangular region at (91, 176) spanning 51 by 13 pixels.
; PLAN: r0=91(x), r1=176(y), r2=51(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 176
LDI r2, 51
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
