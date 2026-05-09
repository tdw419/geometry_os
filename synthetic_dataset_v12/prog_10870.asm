; DESCRIPTION: Composite: Draws a yellow line from (456, 50) to (486, 246) then Sets a single cyan pixel at (453, 63).
; PLAN: r0=456(x1), r1=50(y1), r2=486(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=453(x), r6=63(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 456
LDI r1, 50
LDI r2, 486
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 63
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
