; DESCRIPTION: Composite: . Then Renders a red disk with center (139, 231) and radius 22. Then Draws a yellow rectangle at (50, 74) with width 66 and height 85.
; PLAN: r0=139(x), r1=231(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=50(x), r1=74(y), r2=66(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red disk with center (139, 231) and radius 22.
; PLAN: r0=139(x), r1=231(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 231
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow rectangle at (50, 74) with width 66 and height 85.
; PLAN: r0=50(x), r1=74(y), r2=66(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 74
LDI r2, 66
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
