; DESCRIPTION: Creates a green rectangular region at (52, 46) spanning 52 by 38 pixels.
; PLAN: r0=52(x), r1=46(y), r2=52(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 46
LDI r2, 52
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
