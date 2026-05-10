; DESCRIPTION: Creates a purple rectangular region at (109, 25) spanning 12 by 91 pixels.
; PLAN: r0=109(x), r1=25(y), r2=12(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 25
LDI r2, 12
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
