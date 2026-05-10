; DESCRIPTION: Composite: Places a black line segment connecting (204, 117) to (230, 28) then Places a black dot at position (294, 32).
; PLAN: r0=204(x1), r1=117(y1), r2=230(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=32(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 204
LDI r1, 117
LDI r2, 230
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 32
LDI r7, 0x000000
PSET r5, r6, r7
HALT
