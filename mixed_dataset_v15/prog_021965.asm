; DESCRIPTION: Creates a green rectangular region at (340, 161) spanning 83 by 52 pixels.
; PLAN: r0=340(x), r1=161(y), r2=83(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 161
LDI r2, 83
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
