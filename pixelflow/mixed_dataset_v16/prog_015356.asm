; DESCRIPTION: Draws a blue rectangle at (322, 93) with width 95 and height 90.
; PLAN: r0=322(x), r1=93(y), r2=95(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 93
LDI r2, 95
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
