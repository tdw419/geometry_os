; DESCRIPTION: Composite: . Then Renders a cyan disk with center (205, 200) and radius 35. Then Draws a white rectangle at (136, 115) with width 82 and height 17.
; PLAN: r0=205(x), r1=200(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=136(x), r1=115(y), r2=82(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (205, 200) and radius 35.
; PLAN: r0=205(x), r1=200(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 200
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white rectangle at (136, 115) with width 82 and height 17.
; PLAN: r0=136(x), r1=115(y), r2=82(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 115
LDI r2, 82
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
