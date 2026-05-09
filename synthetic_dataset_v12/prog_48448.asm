; DESCRIPTION: Creates a blue rectangular region at (118, 120) spanning 74 by 102 pixels.
; PLAN: r0=118(x), r1=120(y), r2=74(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 120
LDI r2, 74
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
