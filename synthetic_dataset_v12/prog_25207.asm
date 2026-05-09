; DESCRIPTION: Draws a cyan rectangle at (140, 121) with width 92 and height 77.
; PLAN: r0=140(x), r1=121(y), r2=92(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 121
LDI r2, 92
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
