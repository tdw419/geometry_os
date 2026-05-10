; DESCRIPTION: Creates a purple rectangular region at (223, 55) spanning 56 by 91 pixels.
; PLAN: r0=223(x), r1=55(y), r2=56(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 55
LDI r2, 56
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
