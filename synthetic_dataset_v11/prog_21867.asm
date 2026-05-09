; DESCRIPTION: Composite: . Then Renders a yellow line between points (24, 146) and (198, 233). Then Draws a magenta rectangle at (169, 25) with width 60 and height 52.
; PLAN: r0=24(x1), r1=146(y1), r2=198(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=169(x), r1=25(y), r2=60(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow line between points (24, 146) and (198, 233).
; PLAN: r0=24(x1), r1=146(y1), r2=198(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 146
LDI r2, 198
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta rectangle at (169, 25) with width 60 and height 52.
; PLAN: r0=169(x), r1=25(y), r2=60(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 25
LDI r2, 60
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
