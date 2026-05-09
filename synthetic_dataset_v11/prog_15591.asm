; DESCRIPTION: Composite: . Then Places a cyan circle of radius 74 at center (94, 123). Then Draws a yellow rectangle at (153, 138) with width 47 and height 17.
; PLAN: r0=94(x), r1=123(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=153(x), r1=138(y), r2=47(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 74 at center (94, 123).
; PLAN: r0=94(x), r1=123(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 123
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow rectangle at (153, 138) with width 47 and height 17.
; PLAN: r0=153(x), r1=138(y), r2=47(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 138
LDI r2, 47
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
