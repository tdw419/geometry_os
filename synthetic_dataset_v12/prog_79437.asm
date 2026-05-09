; DESCRIPTION: Creates a green rectangular region at (266, 152) spanning 27 by 62 pixels.
; PLAN: r0=266(x), r1=152(y), r2=27(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 152
LDI r2, 27
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
