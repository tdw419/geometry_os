; DESCRIPTION: Creates a purple rectangular region at (112, 160) spanning 75 by 87 pixels.
; PLAN: r0=112(x), r1=160(y), r2=75(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 160
LDI r2, 75
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
