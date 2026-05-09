; DESCRIPTION: Draws a white rectangle at (149, 129) with width 46 and height 116.
; PLAN: r0=149(x), r1=129(y), r2=46(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 129
LDI r2, 46
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
