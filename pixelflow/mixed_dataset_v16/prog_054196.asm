; DESCRIPTION: Composite: Renders a purple disk with center (419, 125) and radius 12 then Draws a green line from (206, 72) to (467, 172).
; PLAN: r0=419(x), r1=125(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x1), r6=72(y1), r7=467(x2), r8=172(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 125
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 72
LDI r7, 467
LDI r8, 172
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
