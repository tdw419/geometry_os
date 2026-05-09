; DESCRIPTION: Draws a yellow rectangle at (171, 3) with width 76 and height 20.
; PLAN: r0=171(x), r1=3(y), r2=76(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 3
LDI r2, 76
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
