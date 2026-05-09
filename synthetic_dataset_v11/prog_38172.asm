; DESCRIPTION: Creates a green rectangular region at (37, 152) spanning 22 by 47 pixels.
; PLAN: r0=37(x), r1=152(y), r2=22(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 152
LDI r2, 22
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
