; DESCRIPTION: Composite: Sets a single yellow pixel at (196, 208) then Renders a black line between points (448, 67) and (54, 37).
; PLAN: r0=196(x), r1=208(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=448(x1), r6=67(y1), r7=54(x2), r8=37(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 196
LDI r1, 208
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 448
LDI r6, 67
LDI r7, 54
LDI r8, 37
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
