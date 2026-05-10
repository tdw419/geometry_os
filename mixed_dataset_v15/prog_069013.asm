; DESCRIPTION: Creates a green rectangular region at (102, 178) spanning 49 by 36 pixels.
; PLAN: r0=102(x), r1=178(y), r2=49(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 178
LDI r2, 49
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
