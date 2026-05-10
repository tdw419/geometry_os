; DESCRIPTION: Draws a blue rectangle at (100, 47) with width 102 and height 45.
; PLAN: r0=100(x), r1=47(y), r2=102(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 47
LDI r2, 102
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
