; DESCRIPTION: Draws a yellow rectangle at (387, 52) with width 21 and height 76.
; PLAN: r0=387(x), r1=52(y), r2=21(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 52
LDI r2, 21
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
