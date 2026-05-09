; DESCRIPTION: Composite: . Then Draws a blue rectangle at (129, 80) with width 68 and height 32. Then Renders a yellow line between points (7, 93) and (91, 10).
; PLAN: r0=129(x), r1=80(y), r2=68(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=7(x1), r1=93(y1), r2=91(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue rectangle at (129, 80) with width 68 and height 32.
; PLAN: r0=129(x), r1=80(y), r2=68(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 80
LDI r2, 68
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow line between points (7, 93) and (91, 10).
; PLAN: r0=7(x1), r1=93(y1), r2=91(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 93
LDI r2, 91
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
