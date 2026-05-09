; DESCRIPTION: Creates a purple rectangular region at (211, 118) spanning 27 by 86 pixels.
; PLAN: r0=211(x), r1=118(y), r2=27(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 118
LDI r2, 27
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
