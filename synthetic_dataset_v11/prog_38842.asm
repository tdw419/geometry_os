; DESCRIPTION: Composite: . Then Draws a green rectangle at (95, 6) with width 54 and height 40. Then Draws a yellow line from (123, 243) to (248, 204).
; PLAN: r0=95(x), r1=6(y), r2=54(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=123(x1), r1=243(y1), r2=248(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green rectangle at (95, 6) with width 54 and height 40.
; PLAN: r0=95(x), r1=6(y), r2=54(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 6
LDI r2, 54
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow line from (123, 243) to (248, 204).
; PLAN: r0=123(x1), r1=243(y1), r2=248(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 243
LDI r2, 248
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
