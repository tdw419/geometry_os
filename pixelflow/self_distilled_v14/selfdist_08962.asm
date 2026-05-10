; DESCRIPTION: Draws a blue rectangle at (33, 47) with width 21 and height 25.
; PLAN: r0=33(x), r1=47(y), r2=21(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 47
LDI r2, 21
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
