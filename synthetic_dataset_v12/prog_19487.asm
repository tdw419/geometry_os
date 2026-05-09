; DESCRIPTION: Creates a green rectangular region at (71, 83) spanning 74 by 37 pixels.
; PLAN: r0=71(x), r1=83(y), r2=74(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 83
LDI r2, 74
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
