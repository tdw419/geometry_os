; DESCRIPTION: Draws a white rectangle at (371, 152) with width 100 and height 37.
; PLAN: r0=371(x), r1=152(y), r2=100(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 152
LDI r2, 100
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
