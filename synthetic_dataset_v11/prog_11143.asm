; DESCRIPTION: Creates a green rectangular region at (191, 102) spanning 54 by 96 pixels.
; PLAN: r0=191(x), r1=102(y), r2=54(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 102
LDI r2, 54
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
