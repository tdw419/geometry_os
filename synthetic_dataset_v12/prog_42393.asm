; DESCRIPTION: Draws a black rectangle at (298, 190) with width 62 and height 21.
; PLAN: r0=298(x), r1=190(y), r2=62(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 190
LDI r2, 62
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
