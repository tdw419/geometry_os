; DESCRIPTION: Creates a green rectangular region at (204, 193) spanning 20 by 22 pixels.
; PLAN: r0=204(x), r1=193(y), r2=20(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 193
LDI r2, 20
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
