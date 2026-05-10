; DESCRIPTION: Draws a white rectangle at (251, 164) with width 79 and height 49.
; PLAN: r0=251(x), r1=164(y), r2=79(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 164
LDI r2, 79
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
