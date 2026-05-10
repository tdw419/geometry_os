; DESCRIPTION: Composite: Places a orange dot at position (84, 127) then Renders a black line between points (383, 124) and (128, 170).
; PLAN: r0=84(x), r1=127(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=383(x1), r6=124(y1), r7=128(x2), r8=170(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 127
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 383
LDI r6, 124
LDI r7, 128
LDI r8, 170
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
