; DESCRIPTION: Creates a purple rectangular region at (104, 71) spanning 100 by 12 pixels.
; PLAN: r0=104(x), r1=71(y), r2=100(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 71
LDI r2, 100
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
