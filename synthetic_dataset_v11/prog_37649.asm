; DESCRIPTION: Composite: . Then Renders a white box of size 15x79 starting at (175, 2). Then Places a red line segment connecting (112, 130) to (223, 206).
; PLAN: r0=175(x), r1=2(y), r2=15(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=112(x1), r1=130(y1), r2=223(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white box of size 15x79 starting at (175, 2).
; PLAN: r0=175(x), r1=2(y), r2=15(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 2
LDI r2, 15
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red line segment connecting (112, 130) to (223, 206).
; PLAN: r0=112(x1), r1=130(y1), r2=223(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 130
LDI r2, 223
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
