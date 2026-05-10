; DESCRIPTION: Creates a purple filled rectangle of size 15x44 starting at (122, 107).
; PLAN: r0=122(x), r1=107(y), r2=15(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 107
LDI r2, 15
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
