; DESCRIPTION: Creates a green rectangular region at (78, 47) spanning 71 by 33 pixels.
; PLAN: r0=78(x), r1=47(y), r2=71(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 47
LDI r2, 71
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
