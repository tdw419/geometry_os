; DESCRIPTION: Composite: Renders a yellow disk with center (413, 117) and radius 68 then Draws a yellow line from (350, 90) to (410, 122).
; PLAN: r0=413(x), r1=117(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x1), r6=90(y1), r7=410(x2), r8=122(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 413
LDI r1, 117
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 90
LDI r7, 410
LDI r8, 122
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
