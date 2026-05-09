; DESCRIPTION: Draws a black rectangle at (298, 55) with width 27 and height 28.
; PLAN: r0=298(x), r1=55(y), r2=27(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 55
LDI r2, 27
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
