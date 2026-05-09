; DESCRIPTION: Draws a blue rectangle at (298, 36) with width 74 and height 85.
; PLAN: r0=298(x), r1=36(y), r2=74(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 36
LDI r2, 74
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
