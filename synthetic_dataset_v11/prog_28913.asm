; DESCRIPTION: Composite: . Then Renders a white disk with center (143, 80) and radius 41. Then Draws a cyan rectangle at (54, 145) with width 111 and height 49.
; PLAN: r0=143(x), r1=80(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=54(x), r1=145(y), r2=111(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (143, 80) and radius 41.
; PLAN: r0=143(x), r1=80(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 80
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan rectangle at (54, 145) with width 111 and height 49.
; PLAN: r0=54(x), r1=145(y), r2=111(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 145
LDI r2, 111
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
