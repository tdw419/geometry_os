; DESCRIPTION: Composite: Places a orange dot at position (9, 214) then Places a black line segment connecting (156, 14) to (196, 220).
; PLAN: r0=9(x), r1=214(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=156(x1), r6=14(y1), r7=196(x2), r8=220(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 9
LDI r1, 214
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 156
LDI r6, 14
LDI r7, 196
LDI r8, 220
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
