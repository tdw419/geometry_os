; DESCRIPTION: Composite: Places a blue line segment connecting (443, 14) to (28, 179) then Places a yellow dot at position (104, 239).
; PLAN: r0=443(x1), r1=14(y1), r2=28(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=104(x), r6=239(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 443
LDI r1, 14
LDI r2, 28
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 239
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
