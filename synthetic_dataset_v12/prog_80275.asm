; DESCRIPTION: Creates a green rectangular region at (54, 124) spanning 34 by 108 pixels.
; PLAN: r0=54(x), r1=124(y), r2=34(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 124
LDI r2, 34
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
