; DESCRIPTION: Draws a magenta line from (3, 46) to (178, 195).
; PLAN: r0=3(x1), r1=46(y1), r2=178(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 46
LDI r2, 178
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
