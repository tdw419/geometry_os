; DESCRIPTION: Draws a yellow rectangle at (333, 70) with width 51 and height 21.
; PLAN: r0=333(x), r1=70(y), r2=51(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 70
LDI r2, 51
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
