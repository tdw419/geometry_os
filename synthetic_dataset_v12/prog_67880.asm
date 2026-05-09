; DESCRIPTION: Creates a purple rectangular region at (2, 144) spanning 10 by 98 pixels.
; PLAN: r0=2(x), r1=144(y), r2=10(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 144
LDI r2, 10
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
