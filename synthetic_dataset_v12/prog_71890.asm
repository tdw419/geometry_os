; DESCRIPTION: Creates a green rectangular region at (368, 158) spanning 61 by 66 pixels.
; PLAN: r0=368(x), r1=158(y), r2=61(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 158
LDI r2, 61
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
