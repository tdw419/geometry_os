; DESCRIPTION: Composite: Draws a magenta line from (328, 16) to (28, 151) then Sets a single blue pixel at (132, 50).
; PLAN: r0=328(x1), r1=16(y1), r2=28(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=132(x), r6=50(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 328
LDI r1, 16
LDI r2, 28
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 50
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
