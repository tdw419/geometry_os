; DESCRIPTION: Creates a purple rectangular region at (87, 29) spanning 73 by 91 pixels.
; PLAN: r0=87(x), r1=29(y), r2=73(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 29
LDI r2, 73
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
