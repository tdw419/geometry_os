; DESCRIPTION: Composite: Draws a purple line from (127, 116) to (190, 144) then Places a cyan dot at position (505, 229).
; PLAN: r0=127(x1), r1=116(y1), r2=190(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=505(x), r6=229(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 127
LDI r1, 116
LDI r2, 190
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 505
LDI r6, 229
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
