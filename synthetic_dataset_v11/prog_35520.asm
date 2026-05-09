; DESCRIPTION: Composite: . Then Renders a white disk with center (180, 101) and radius 71. Then Draws a cyan rectangle at (124, 43) with width 70 and height 87.
; PLAN: r0=180(x), r1=101(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=124(x), r1=43(y), r2=70(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (180, 101) and radius 71.
; PLAN: r0=180(x), r1=101(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 101
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan rectangle at (124, 43) with width 70 and height 87.
; PLAN: r0=124(x), r1=43(y), r2=70(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 43
LDI r2, 70
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
