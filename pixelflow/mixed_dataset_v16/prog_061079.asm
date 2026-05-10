; DESCRIPTION: Creates a purple rectangular region at (302, 134) spanning 105 by 87 pixels.
; PLAN: r0=302(x), r1=134(y), r2=105(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 134
LDI r2, 105
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
