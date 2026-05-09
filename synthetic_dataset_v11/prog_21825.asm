; DESCRIPTION: Composite: . Then Renders a orange disk with center (202, 217) and radius 32. Then Draws a green line from (208, 2) to (80, 163).
; PLAN: r0=202(x), r1=217(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=208(x1), r1=2(y1), r2=80(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange disk with center (202, 217) and radius 32.
; PLAN: r0=202(x), r1=217(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 217
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green line from (208, 2) to (80, 163).
; PLAN: r0=208(x1), r1=2(y1), r2=80(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 2
LDI r2, 80
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
