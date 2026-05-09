; DESCRIPTION: Draws a white rectangle at (180, 103) with width 65 and height 96.
; PLAN: r0=180(x), r1=103(y), r2=65(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 103
LDI r2, 65
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
