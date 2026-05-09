; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (125, 217) with width 77 and height 33. Then Renders a white disk with center (109, 161) and radius 68.
; PLAN: r0=125(x), r1=217(y), r2=77(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=109(x), r1=161(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan rectangle at (125, 217) with width 77 and height 33.
; PLAN: r0=125(x), r1=217(y), r2=77(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 217
LDI r2, 77
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white disk with center (109, 161) and radius 68.
; PLAN: r0=109(x), r1=161(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 161
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
