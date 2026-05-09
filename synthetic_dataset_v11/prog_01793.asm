; DESCRIPTION: Composite: . Then Draws a yellow line from (132, 60) to (96, 146). Then Renders a magenta disk with center (49, 211) and radius 30.
; PLAN: r0=132(x1), r1=60(y1), r2=96(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=49(x), r1=211(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow line from (132, 60) to (96, 146).
; PLAN: r0=132(x1), r1=60(y1), r2=96(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 60
LDI r2, 96
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta disk with center (49, 211) and radius 30.
; PLAN: r0=49(x), r1=211(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 211
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
