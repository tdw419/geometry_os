; DESCRIPTION: Composite: . Then Renders a white disk with center (144, 211) and radius 18. Then Draws a magenta rectangle at (80, 124) with width 102 and height 59.
; PLAN: r0=144(x), r1=211(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=80(x), r1=124(y), r2=102(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (144, 211) and radius 18.
; PLAN: r0=144(x), r1=211(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 211
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta rectangle at (80, 124) with width 102 and height 59.
; PLAN: r0=80(x), r1=124(y), r2=102(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 124
LDI r2, 102
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
