; DESCRIPTION: Composite: Sets a single magenta pixel at (198, 119) then Draws a green line from (127, 24) to (45, 12).
; PLAN: r0=198(x), r1=119(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=127(x1), r6=24(y1), r7=45(x2), r8=12(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 119
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 127
LDI r6, 24
LDI r7, 45
LDI r8, 12
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
