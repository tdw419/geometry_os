; DESCRIPTION: Creates a purple rectangular region at (461, 44) spanning 37 by 66 pixels.
; PLAN: r0=461(x), r1=44(y), r2=37(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 44
LDI r2, 37
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
