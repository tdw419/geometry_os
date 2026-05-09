; DESCRIPTION: Creates a green rectangular region at (222, 70) spanning 95 by 52 pixels.
; PLAN: r0=222(x), r1=70(y), r2=95(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 70
LDI r2, 95
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
