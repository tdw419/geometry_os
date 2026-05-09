; DESCRIPTION: Composite: Draws a yellow line from (474, 82) to (409, 202) then Sets a single cyan pixel at (490, 32).
; PLAN: r0=474(x1), r1=82(y1), r2=409(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=490(x), r6=32(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 474
LDI r1, 82
LDI r2, 409
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 32
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
