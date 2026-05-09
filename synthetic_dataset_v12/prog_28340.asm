; DESCRIPTION: Composite: Renders a orange disk with center (362, 145) and radius 58 then Draws a green line from (423, 57) to (18, 117).
; PLAN: r0=362(x), r1=145(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=423(x1), r6=57(y1), r7=18(x2), r8=117(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 362
LDI r1, 145
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 423
LDI r6, 57
LDI r7, 18
LDI r8, 117
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
