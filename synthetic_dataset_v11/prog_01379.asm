; DESCRIPTION: Draws a cyan rectangle at (124, 151) with width 92 and height 74.
; PLAN: r0=124(x), r1=151(y), r2=92(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 151
LDI r2, 92
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
