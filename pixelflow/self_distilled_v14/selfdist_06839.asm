; DESCRIPTION: Draws a purple rectangle at (356, 47) with width 50 and height 12.
; PLAN: r0=356(x), r1=47(y), r2=50(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 47
LDI r2, 50
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
