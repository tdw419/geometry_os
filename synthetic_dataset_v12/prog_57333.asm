; DESCRIPTION: Draws a white rectangle at (443, 143) with width 29 and height 105.
; PLAN: r0=443(x), r1=143(y), r2=29(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 143
LDI r2, 29
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
