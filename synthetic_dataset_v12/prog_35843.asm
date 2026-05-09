; DESCRIPTION: Composite: Draws a magenta line from (440, 140) to (27, 63) then Renders a yellow disk with center (261, 171) and radius 56.
; PLAN: r0=440(x1), r1=140(y1), r2=27(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=171(y), r7=56(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 440
LDI r1, 140
LDI r2, 27
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 171
LDI r7, 56
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
