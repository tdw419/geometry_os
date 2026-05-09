; DESCRIPTION: Composite: . Then Renders a green box of size 38x109 starting at (47, 88). Then Draws a black line from (201, 177) to (147, 167).
; PLAN: r0=47(x), r1=88(y), r2=38(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=201(x1), r1=177(y1), r2=147(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green box of size 38x109 starting at (47, 88).
; PLAN: r0=47(x), r1=88(y), r2=38(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 88
LDI r2, 38
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black line from (201, 177) to (147, 167).
; PLAN: r0=201(x1), r1=177(y1), r2=147(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 177
LDI r2, 147
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
