; DESCRIPTION: Creates a purple rectangular region at (129, 146) spanning 107 by 73 pixels.
; PLAN: r0=129(x), r1=146(y), r2=107(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 146
LDI r2, 107
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
