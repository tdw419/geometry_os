; DESCRIPTION: Draws a black rectangle at (243, 27) with width 20 and height 10.
; PLAN: r0=243(x), r1=27(y), r2=20(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 27
LDI r2, 20
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
