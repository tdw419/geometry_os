; DESCRIPTION: Composite: Draws a magenta line from (35, 249) to (448, 138) then Places a blue circle of radius 44 at center (373, 103).
; PLAN: r0=35(x1), r1=249(y1), r2=448(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=103(y), r7=44(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 35
LDI r1, 249
LDI r2, 448
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 103
LDI r7, 44
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
