; DESCRIPTION: Draws a white rectangle at (320, 90) with width 16 and height 46.
; PLAN: r0=320(x), r1=90(y), r2=16(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 90
LDI r2, 16
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
