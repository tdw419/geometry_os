; DESCRIPTION: Composite: Places a black line segment connecting (294, 153) to (100, 184) then Places a red dot at position (438, 210).
; PLAN: r0=294(x1), r1=153(y1), r2=100(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=438(x), r6=210(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 294
LDI r1, 153
LDI r2, 100
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 210
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
