; DESCRIPTION: Creates a green rectangular region at (248, 138) spanning 81 by 96 pixels.
; PLAN: r0=248(x), r1=138(y), r2=81(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 138
LDI r2, 81
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
