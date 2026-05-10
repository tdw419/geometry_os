; DESCRIPTION: Composite: Places a purple dot at position (333, 64) then Draws a blue line from (200, 42) to (4, 8).
; PLAN: r0=333(x), r1=64(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=200(x1), r6=42(y1), r7=4(x2), r8=8(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 333
LDI r1, 64
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 200
LDI r6, 42
LDI r7, 4
LDI r8, 8
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
