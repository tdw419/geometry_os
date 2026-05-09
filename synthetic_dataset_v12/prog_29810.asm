; DESCRIPTION: Draws a magenta line from (43, 1) to (272, 164).
; PLAN: r0=43(x1), r1=1(y1), r2=272(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 1
LDI r2, 272
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
