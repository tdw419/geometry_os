; DESCRIPTION: Draws a cyan rectangle at (59, 53) with width 51 and height 31.
; PLAN: r0=59(x), r1=53(y), r2=51(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 53
LDI r2, 51
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
