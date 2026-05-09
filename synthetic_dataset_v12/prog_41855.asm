; DESCRIPTION: Composite: Places a purple dot at position (407, 37) then Places a blue line segment connecting (333, 164) to (61, 238).
; PLAN: r0=407(x), r1=37(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=333(x1), r6=164(y1), r7=61(x2), r8=238(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 407
LDI r1, 37
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 333
LDI r6, 164
LDI r7, 61
LDI r8, 238
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
