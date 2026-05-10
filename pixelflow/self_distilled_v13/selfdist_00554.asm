; DESCRIPTION: Draws a blue rectangle at (387, 140) with width 87 and height 71.
; PLAN: r0=387(x), r1=140(y), r2=87(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 140
LDI r2, 87
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
