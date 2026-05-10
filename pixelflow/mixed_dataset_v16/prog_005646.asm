; DESCRIPTION: Composite: Draws a blue line from (404, 255) to (99, 168) then Sets a single purple pixel at (222, 75).
; PLAN: r0=404(x1), r1=255(y1), r2=99(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=222(x), r6=75(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 404
LDI r1, 255
LDI r2, 99
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 75
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
