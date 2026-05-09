; DESCRIPTION: Composite: . Then Draws a yellow line from (138, 172) to (109, 48). Then Creates a red circular shape at (212, 106) with radius 20.
; PLAN: r0=138(x1), r1=172(y1), r2=109(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=212(x), r1=106(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow line from (138, 172) to (109, 48).
; PLAN: r0=138(x1), r1=172(y1), r2=109(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 172
LDI r2, 109
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red circular shape at (212, 106) with radius 20.
; PLAN: r0=212(x), r1=106(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 106
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
