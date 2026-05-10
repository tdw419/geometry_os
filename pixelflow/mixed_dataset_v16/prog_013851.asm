; DESCRIPTION: Draws a green rectangle at (485, 134) with width 10 and height 72.
; PLAN: r0=485(x), r1=134(y), r2=10(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 134
LDI r2, 10
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
