; DESCRIPTION: Draws a magenta line from (375, 0) to (340, 199).
; PLAN: r0=375(x1), r1=0(y1), r2=340(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 0
LDI r2, 340
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
