; DESCRIPTION: Draws a cyan rectangle at (14, 51) with width 13 and height 61.
; PLAN: r0=14(x), r1=51(y), r2=13(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 51
LDI r2, 13
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
