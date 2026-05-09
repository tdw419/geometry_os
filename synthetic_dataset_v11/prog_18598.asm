; DESCRIPTION: Creates a purple rectangular region at (91, 83) spanning 75 by 59 pixels.
; PLAN: r0=91(x), r1=83(y), r2=75(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 83
LDI r2, 75
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
