; DESCRIPTION: Draws a white rectangle at (229, 73) with width 60 and height 76.
; PLAN: r0=229(x), r1=73(y), r2=60(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 73
LDI r2, 60
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
