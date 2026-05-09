; DESCRIPTION: Composite: . Then Draws a black rectangle at (187, 85) with width 54 and height 44. Then Renders a black disk with center (48, 190) and radius 44.
; PLAN: r0=187(x), r1=85(y), r2=54(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=48(x), r1=190(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black rectangle at (187, 85) with width 54 and height 44.
; PLAN: r0=187(x), r1=85(y), r2=54(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 85
LDI r2, 54
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black disk with center (48, 190) and radius 44.
; PLAN: r0=48(x), r1=190(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 190
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
