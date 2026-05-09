; DESCRIPTION: Composite: Renders a blue disk with center (98, 131) and radius 78 then Draws a white line from (485, 147) to (272, 207).
; PLAN: r0=98(x), r1=131(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=485(x1), r6=147(y1), r7=272(x2), r8=207(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 131
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 485
LDI r6, 147
LDI r7, 272
LDI r8, 207
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
