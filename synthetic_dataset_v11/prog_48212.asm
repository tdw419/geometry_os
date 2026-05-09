; DESCRIPTION: Draws a white rectangle at (96, 146) with width 97 and height 60.
; PLAN: r0=96(x), r1=146(y), r2=97(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 146
LDI r2, 97
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
