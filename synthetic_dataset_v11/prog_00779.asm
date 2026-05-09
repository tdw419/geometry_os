; DESCRIPTION: Creates a green rectangular region at (25, 57) spanning 71 by 31 pixels.
; PLAN: r0=25(x), r1=57(y), r2=71(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 57
LDI r2, 71
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
