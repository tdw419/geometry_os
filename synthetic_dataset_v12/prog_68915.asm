; DESCRIPTION: Composite: Renders a yellow line between points (373, 69) and (284, 232) then Sets a single yellow pixel at (303, 249).
; PLAN: r0=373(x1), r1=69(y1), r2=284(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=249(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 373
LDI r1, 69
LDI r2, 284
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 249
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
