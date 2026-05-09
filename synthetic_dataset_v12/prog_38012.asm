; DESCRIPTION: Draws a green rectangle at (298, 126) with width 47 and height 79.
; PLAN: r0=298(x), r1=126(y), r2=47(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 126
LDI r2, 47
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
