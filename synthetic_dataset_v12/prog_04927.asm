; DESCRIPTION: Draws a purple rectangle at (394, 28) with width 109 and height 31.
; PLAN: r0=394(x), r1=28(y), r2=109(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 28
LDI r2, 109
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
