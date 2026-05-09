; DESCRIPTION: Creates a green rectangular region at (320, 91) spanning 70 by 27 pixels.
; PLAN: r0=320(x), r1=91(y), r2=70(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 91
LDI r2, 70
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
