; DESCRIPTION: Draws a white rectangle at (277, 79) with width 79 and height 96.
; PLAN: r0=277(x), r1=79(y), r2=79(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 79
LDI r2, 79
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
