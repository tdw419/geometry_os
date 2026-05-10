; DESCRIPTION: Creates a purple rectangular region at (210, 75) spanning 98 by 26 pixels.
; PLAN: r0=210(x), r1=75(y), r2=98(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 75
LDI r2, 98
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
