; DESCRIPTION: Composite: . Then Places a magenta circle of radius 21 at center (75, 125). Then Draws a red line from (174, 0) to (214, 163).
; PLAN: r0=75(x), r1=125(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=174(x1), r1=0(y1), r2=214(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 21 at center (75, 125).
; PLAN: r0=75(x), r1=125(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 125
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red line from (174, 0) to (214, 163).
; PLAN: r0=174(x1), r1=0(y1), r2=214(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 0
LDI r2, 214
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
