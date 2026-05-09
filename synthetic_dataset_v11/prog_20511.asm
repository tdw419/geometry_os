; DESCRIPTION: Draws a cyan rectangle at (51, 59) with width 114 and height 70.
; PLAN: r0=51(x), r1=59(y), r2=114(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 59
LDI r2, 114
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
