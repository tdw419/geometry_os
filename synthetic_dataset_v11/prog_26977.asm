; DESCRIPTION: Creates a purple rectangular region at (65, 39) spanning 120 by 118 pixels.
; PLAN: r0=65(x), r1=39(y), r2=120(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 39
LDI r2, 120
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
