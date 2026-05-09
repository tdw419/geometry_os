; DESCRIPTION: Creates a green rectangular region at (357, 209) spanning 36 by 30 pixels.
; PLAN: r0=357(x), r1=209(y), r2=36(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 209
LDI r2, 36
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
