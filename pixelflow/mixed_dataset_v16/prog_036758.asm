; DESCRIPTION: Creates a purple rectangular region at (192, 119) spanning 63 by 117 pixels.
; PLAN: r0=192(x), r1=119(y), r2=63(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 119
LDI r2, 63
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
