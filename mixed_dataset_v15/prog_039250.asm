; DESCRIPTION: Creates a green rectangular region at (291, 79) spanning 70 by 119 pixels.
; PLAN: r0=291(x), r1=79(y), r2=70(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 79
LDI r2, 70
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
