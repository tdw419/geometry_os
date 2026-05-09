; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (127, 104) with width 80 and height 37. Then Renders a cyan disk with center (222, 158) and radius 34.
; PLAN: r0=127(x), r1=104(y), r2=80(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=222(x), r1=158(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan rectangle at (127, 104) with width 80 and height 37.
; PLAN: r0=127(x), r1=104(y), r2=80(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 104
LDI r2, 80
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan disk with center (222, 158) and radius 34.
; PLAN: r0=222(x), r1=158(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 158
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
