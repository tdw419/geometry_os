; DESCRIPTION: Creates a purple rectangular region at (139, 40) spanning 59 by 75 pixels.
; PLAN: r0=139(x), r1=40(y), r2=59(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 40
LDI r2, 59
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
