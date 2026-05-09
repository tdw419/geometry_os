; DESCRIPTION: Composite: . Then Renders a yellow line between points (242, 54) and (25, 214). Then Draws a yellow rectangle at (33, 110) with width 40 and height 82.
; PLAN: r0=242(x1), r1=54(y1), r2=25(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=33(x), r1=110(y), r2=40(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow line between points (242, 54) and (25, 214).
; PLAN: r0=242(x1), r1=54(y1), r2=25(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 54
LDI r2, 25
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow rectangle at (33, 110) with width 40 and height 82.
; PLAN: r0=33(x), r1=110(y), r2=40(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 110
LDI r2, 40
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
