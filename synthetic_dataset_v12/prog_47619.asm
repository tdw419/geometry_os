; DESCRIPTION: Composite: Renders a green line between points (293, 129) and (132, 35) then Draws a blue circle centered at (405, 138) with radius 63.
; PLAN: r0=293(x1), r1=129(y1), r2=132(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=405(x), r6=138(y), r7=63(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 293
LDI r1, 129
LDI r2, 132
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 138
LDI r7, 63
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
