; DESCRIPTION: Composite: Renders a white line between points (72, 134) and (303, 193) then Sets a single blue pixel at (215, 189).
; PLAN: r0=72(x1), r1=134(y1), r2=303(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=215(x), r6=189(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 72
LDI r1, 134
LDI r2, 303
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 189
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
