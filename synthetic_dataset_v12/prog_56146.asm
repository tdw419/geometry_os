; DESCRIPTION: Creates a purple rectangular region at (112, 209) spanning 118 by 47 pixels.
; PLAN: r0=112(x), r1=209(y), r2=118(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 209
LDI r2, 118
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
