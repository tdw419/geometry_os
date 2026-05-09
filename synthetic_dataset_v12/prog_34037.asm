; DESCRIPTION: Creates a yellow rectangular region at (422, 101) spanning 85 by 118 pixels.
; PLAN: r0=422(x), r1=101(y), r2=85(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 101
LDI r2, 85
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
