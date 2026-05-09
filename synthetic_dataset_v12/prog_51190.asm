; DESCRIPTION: Draws a yellow rectangle at (387, 164) with width 71 and height 73.
; PLAN: r0=387(x), r1=164(y), r2=71(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 164
LDI r2, 71
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
