; DESCRIPTION: Composite: . Then Renders a green line between points (14, 74) and (220, 46). Then Draws a magenta circle centered at (103, 93) with radius 73.
; PLAN: r0=14(x1), r1=74(y1), r2=220(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=103(x), r1=93(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a green line between points (14, 74) and (220, 46).
; PLAN: r0=14(x1), r1=74(y1), r2=220(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 74
LDI r2, 220
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta circle centered at (103, 93) with radius 73.
; PLAN: r0=103(x), r1=93(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 93
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
