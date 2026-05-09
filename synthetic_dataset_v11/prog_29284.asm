; DESCRIPTION: Draws a white rectangle at (161, 143) with width 91 and height 44.
; PLAN: r0=161(x), r1=143(y), r2=91(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 143
LDI r2, 91
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
