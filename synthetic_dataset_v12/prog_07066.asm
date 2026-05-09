; DESCRIPTION: Draws a cyan rectangle at (303, 110) with width 120 and height 29.
; PLAN: r0=303(x), r1=110(y), r2=120(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 110
LDI r2, 120
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
