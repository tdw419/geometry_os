; DESCRIPTION: Composite: Draws a white line from (265, 61) to (234, 120) then Sets a single magenta pixel at (414, 91).
; PLAN: r0=265(x1), r1=61(y1), r2=234(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=414(x), r6=91(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 265
LDI r1, 61
LDI r2, 234
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 91
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
