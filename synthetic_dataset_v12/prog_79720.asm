; DESCRIPTION: Draws a purple rectangle at (237, 152) with width 71 and height 102.
; PLAN: r0=237(x), r1=152(y), r2=71(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 152
LDI r2, 71
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
