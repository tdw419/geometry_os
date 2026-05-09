; DESCRIPTION: Creates a purple rectangular region at (48, 159) spanning 118 by 38 pixels.
; PLAN: r0=48(x), r1=159(y), r2=118(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 159
LDI r2, 118
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
