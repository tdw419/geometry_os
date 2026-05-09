; DESCRIPTION: Creates a blue rectangular region at (93, 104) spanning 25 by 77 pixels.
; PLAN: r0=93(x), r1=104(y), r2=25(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 104
LDI r2, 25
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
