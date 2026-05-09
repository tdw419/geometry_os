; DESCRIPTION: Draws a white rectangle at (48, 46) with width 108 and height 85.
; PLAN: r0=48(x), r1=46(y), r2=108(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 46
LDI r2, 108
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
