; DESCRIPTION: Composite: . Then Creates a red circular shape at (120, 144) with radius 63. Then Draws a yellow line from (208, 89) to (144, 132).
; PLAN: r0=120(x), r1=144(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=208(x1), r1=89(y1), r2=144(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red circular shape at (120, 144) with radius 63.
; PLAN: r0=120(x), r1=144(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 144
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow line from (208, 89) to (144, 132).
; PLAN: r0=208(x1), r1=89(y1), r2=144(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 89
LDI r2, 144
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
