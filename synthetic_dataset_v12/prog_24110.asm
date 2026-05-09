; DESCRIPTION: Creates a blue rectangular region at (292, 118) spanning 27 by 106 pixels.
; PLAN: r0=292(x), r1=118(y), r2=27(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 118
LDI r2, 27
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
