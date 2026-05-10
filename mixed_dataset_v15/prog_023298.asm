; DESCRIPTION: Composite: Draws a green line from (263, 37) to (315, 54) then Sets a single cyan pixel at (474, 58).
; PLAN: r0=263(x1), r1=37(y1), r2=315(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=474(x), r6=58(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 263
LDI r1, 37
LDI r2, 315
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 58
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
