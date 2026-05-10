; DESCRIPTION: Composite: Renders a white line between points (150, 209) and (222, 122) then Sets a single green pixel at (262, 91).
; PLAN: r0=150(x1), r1=209(y1), r2=222(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=262(x), r6=91(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 150
LDI r1, 209
LDI r2, 222
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 91
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
