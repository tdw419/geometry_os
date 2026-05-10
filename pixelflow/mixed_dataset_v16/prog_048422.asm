; DESCRIPTION: Draws a cyan rectangle at (298, 139) with width 105 and height 47.
; PLAN: r0=298(x), r1=139(y), r2=105(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 139
LDI r2, 105
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
