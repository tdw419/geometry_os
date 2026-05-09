; DESCRIPTION: Draws a blue rectangle at (243, 7) with width 113 and height 65.
; PLAN: r0=243(x), r1=7(y), r2=113(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 7
LDI r2, 113
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
