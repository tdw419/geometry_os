; DESCRIPTION: Draws a magenta line from (391, 20) to (164, 28).
; PLAN: r0=391(x1), r1=20(y1), r2=164(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 20
LDI r2, 164
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
