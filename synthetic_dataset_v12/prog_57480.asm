; DESCRIPTION: Composite: Places a white line segment connecting (329, 25) to (193, 173) then Sets a single green pixel at (377, 230).
; PLAN: r0=329(x1), r1=25(y1), r2=193(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=377(x), r6=230(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 329
LDI r1, 25
LDI r2, 193
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 230
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
