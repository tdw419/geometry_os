; DESCRIPTION: Composite: . Then Renders a yellow disk with center (209, 200) and radius 14. Then Draws a cyan rectangle at (93, 155) with width 72 and height 72.
; PLAN: r0=209(x), r1=200(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=93(x), r1=155(y), r2=72(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow disk with center (209, 200) and radius 14.
; PLAN: r0=209(x), r1=200(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 200
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan rectangle at (93, 155) with width 72 and height 72.
; PLAN: r0=93(x), r1=155(y), r2=72(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 155
LDI r2, 72
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
