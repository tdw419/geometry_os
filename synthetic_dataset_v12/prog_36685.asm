; DESCRIPTION: Composite: Places a green line segment connecting (238, 247) to (507, 22) then Places a white dot at position (193, 110).
; PLAN: r0=238(x1), r1=247(y1), r2=507(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=110(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 238
LDI r1, 247
LDI r2, 507
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 110
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
