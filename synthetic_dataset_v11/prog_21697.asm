; DESCRIPTION: Composite: . Then Draws a yellow line from (222, 142) to (123, 12). Then Draws a green rectangle at (37, 4) with width 35 and height 106.
; PLAN: r0=222(x1), r1=142(y1), r2=123(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=37(x), r1=4(y), r2=35(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow line from (222, 142) to (123, 12).
; PLAN: r0=222(x1), r1=142(y1), r2=123(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 142
LDI r2, 123
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green rectangle at (37, 4) with width 35 and height 106.
; PLAN: r0=37(x), r1=4(y), r2=35(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 4
LDI r2, 35
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
