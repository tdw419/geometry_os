; DESCRIPTION: Draws a blue rectangle at (202, 44) with width 76 and height 75.
; PLAN: r0=202(x), r1=44(y), r2=76(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 44
LDI r2, 76
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
