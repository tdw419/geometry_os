; DESCRIPTION: Draws a red rectangle at (470, 83) with width 18 and height 73.
; PLAN: r0=470(x), r1=83(y), r2=18(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 83
LDI r2, 18
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
