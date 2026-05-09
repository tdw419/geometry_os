; DESCRIPTION: Draws a magenta line from (44, 191) to (434, 183).
; PLAN: r0=44(x1), r1=191(y1), r2=434(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 191
LDI r2, 434
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
