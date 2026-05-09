; DESCRIPTION: Draws a white rectangle at (197, 142) with width 91 and height 102.
; PLAN: r0=197(x), r1=142(y), r2=91(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 142
LDI r2, 91
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
