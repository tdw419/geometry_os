; DESCRIPTION: Creates a purple rectangular region at (109, 194) spanning 89 by 10 pixels.
; PLAN: r0=109(x), r1=194(y), r2=89(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 194
LDI r2, 89
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
