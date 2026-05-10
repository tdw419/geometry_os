; DESCRIPTION: Creates a green rectangular region at (209, 100) spanning 68 by 94 pixels.
; PLAN: r0=209(x), r1=100(y), r2=68(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 100
LDI r2, 68
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
