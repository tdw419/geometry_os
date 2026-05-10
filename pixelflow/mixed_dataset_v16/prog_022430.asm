; DESCRIPTION: Creates a green rectangular region at (439, 117) spanning 47 by 88 pixels.
; PLAN: r0=439(x), r1=117(y), r2=47(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 117
LDI r2, 47
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
