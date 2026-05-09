; DESCRIPTION: Composite: Draws a magenta line from (236, 168) to (189, 100) then Places a purple dot at position (54, 99).
; PLAN: r0=236(x1), r1=168(y1), r2=189(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=54(x), r6=99(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 236
LDI r1, 168
LDI r2, 189
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 99
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
