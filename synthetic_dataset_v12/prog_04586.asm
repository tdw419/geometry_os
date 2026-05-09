; DESCRIPTION: Creates a green rectangular region at (239, 164) spanning 97 by 34 pixels.
; PLAN: r0=239(x), r1=164(y), r2=97(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 164
LDI r2, 97
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
