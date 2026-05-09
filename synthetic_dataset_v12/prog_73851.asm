; DESCRIPTION: Draws a white rectangle at (346, 161) with width 98 and height 30.
; PLAN: r0=346(x), r1=161(y), r2=98(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 161
LDI r2, 98
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
