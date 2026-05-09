; DESCRIPTION: Draws a white rectangle at (443, 44) with width 51 and height 108.
; PLAN: r0=443(x), r1=44(y), r2=51(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 44
LDI r2, 51
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
