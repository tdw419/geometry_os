; DESCRIPTION: Creates a purple rectangular region at (350, 75) spanning 54 by 91 pixels.
; PLAN: r0=350(x), r1=75(y), r2=54(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 75
LDI r2, 54
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
