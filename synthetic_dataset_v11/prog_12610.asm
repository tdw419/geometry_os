; DESCRIPTION: Creates a green rectangular region at (38, 204) spanning 31 by 22 pixels.
; PLAN: r0=38(x), r1=204(y), r2=31(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 204
LDI r2, 31
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
