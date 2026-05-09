; DESCRIPTION: Draws a white rectangle at (320, 47) with width 32 and height 112.
; PLAN: r0=320(x), r1=47(y), r2=32(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 47
LDI r2, 32
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
