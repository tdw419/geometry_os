; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (54, 2) with width 119 and height 24. Then Places a orange circle of radius 44 at center (123, 57).
; PLAN: r0=54(x), r1=2(y), r2=119(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=123(x), r1=57(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow rectangle at (54, 2) with width 119 and height 24.
; PLAN: r0=54(x), r1=2(y), r2=119(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 2
LDI r2, 119
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange circle of radius 44 at center (123, 57).
; PLAN: r0=123(x), r1=57(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 57
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
