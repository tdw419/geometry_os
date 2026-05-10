; DESCRIPTION: Draws a white rectangle at (196, 180) with width 44 and height 12.
; PLAN: r0=196(x), r1=180(y), r2=44(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 180
LDI r2, 44
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
