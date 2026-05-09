; DESCRIPTION: Draws a cyan rectangle at (102, 77) with width 84 and height 44.
; PLAN: r0=102(x), r1=77(y), r2=84(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 77
LDI r2, 84
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
