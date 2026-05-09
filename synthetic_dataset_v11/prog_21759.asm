; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (207, 54) with radius 32. Then Renders a yellow line between points (65, 163) and (126, 133).
; PLAN: r0=207(x), r1=54(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=65(x1), r1=163(y1), r2=126(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow circle centered at (207, 54) with radius 32.
; PLAN: r0=207(x), r1=54(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 54
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow line between points (65, 163) and (126, 133).
; PLAN: r0=65(x1), r1=163(y1), r2=126(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 163
LDI r2, 126
LDI r3, 133
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
