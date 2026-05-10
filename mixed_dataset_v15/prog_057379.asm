; DESCRIPTION: Composite: Places a yellow dot at position (356, 30) then Draws a orange line from (464, 9) to (111, 192).
; PLAN: r0=356(x), r1=30(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=464(x1), r6=9(y1), r7=111(x2), r8=192(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 30
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 464
LDI r6, 9
LDI r7, 111
LDI r8, 192
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
