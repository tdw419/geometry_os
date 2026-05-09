; DESCRIPTION: Creates a purple rectangular region at (106, 115) spanning 39 by 83 pixels.
; PLAN: r0=106(x), r1=115(y), r2=39(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 115
LDI r2, 39
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
