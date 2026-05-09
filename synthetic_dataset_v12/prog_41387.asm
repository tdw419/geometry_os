; DESCRIPTION: Creates a green rectangular region at (329, 80) spanning 17 by 79 pixels.
; PLAN: r0=329(x), r1=80(y), r2=17(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 80
LDI r2, 17
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
