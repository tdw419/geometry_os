; DESCRIPTION: Composite: Places a white 102x37 rectangle at position (317, 188) then Sets a single yellow pixel at (476, 89).
; PLAN: r0=317(x), r1=188(y), r2=102(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=476(x), r6=89(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 317
LDI r1, 188
LDI r2, 102
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 89
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
