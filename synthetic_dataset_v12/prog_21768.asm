; DESCRIPTION: Draws a purple rectangle at (387, 160) with width 71 and height 65.
; PLAN: r0=387(x), r1=160(y), r2=71(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 160
LDI r2, 71
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
