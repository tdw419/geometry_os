; DESCRIPTION: Creates a purple rectangular region at (68, 24) spanning 107 by 48 pixels.
; PLAN: r0=68(x), r1=24(y), r2=107(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 24
LDI r2, 107
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
