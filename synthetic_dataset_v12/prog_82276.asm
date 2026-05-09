; DESCRIPTION: Draws a yellow rectangle at (315, 214) with width 33 and height 28.
; PLAN: r0=315(x), r1=214(y), r2=33(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 214
LDI r2, 33
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
