; DESCRIPTION: Composite: Places a white line segment connecting (235, 197) to (334, 99) then Places a red dot at position (244, 100).
; PLAN: r0=235(x1), r1=197(y1), r2=334(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=100(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 235
LDI r1, 197
LDI r2, 334
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 100
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
