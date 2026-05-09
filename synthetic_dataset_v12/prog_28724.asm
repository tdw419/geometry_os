; DESCRIPTION: Composite: Places a yellow dot at position (131, 209) then Places a white line segment connecting (19, 73) to (327, 15).
; PLAN: r0=131(x), r1=209(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=19(x1), r6=73(y1), r7=327(x2), r8=15(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 131
LDI r1, 209
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 19
LDI r6, 73
LDI r7, 327
LDI r8, 15
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
