; DESCRIPTION: Draws a white rectangle at (331, 218) with width 91 and height 31.
; PLAN: r0=331(x), r1=218(y), r2=91(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 218
LDI r2, 91
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
