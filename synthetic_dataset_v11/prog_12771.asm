; DESCRIPTION: Creates a purple rectangular region at (111, 8) spanning 97 by 91 pixels.
; PLAN: r0=111(x), r1=8(y), r2=97(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 8
LDI r2, 97
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
