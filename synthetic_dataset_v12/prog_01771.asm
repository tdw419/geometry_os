; DESCRIPTION: Creates a purple rectangular region at (372, 3) spanning 27 by 118 pixels.
; PLAN: r0=372(x), r1=3(y), r2=27(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 3
LDI r2, 27
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
