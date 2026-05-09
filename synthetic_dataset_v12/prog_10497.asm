; DESCRIPTION: Draws a white rectangle at (271, 108) with width 97 and height 80.
; PLAN: r0=271(x), r1=108(y), r2=97(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 108
LDI r2, 97
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
