; DESCRIPTION: Creates a green rectangular region at (86, 174) spanning 71 by 33 pixels.
; PLAN: r0=86(x), r1=174(y), r2=71(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 174
LDI r2, 71
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
