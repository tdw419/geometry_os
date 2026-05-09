; DESCRIPTION: Draws a white rectangle at (24, 152) with width 16 and height 76.
; PLAN: r0=24(x), r1=152(y), r2=16(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 152
LDI r2, 16
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
