; DESCRIPTION: Creates a green rectangular region at (354, 47) spanning 88 by 107 pixels.
; PLAN: r0=354(x), r1=47(y), r2=88(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 47
LDI r2, 88
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
