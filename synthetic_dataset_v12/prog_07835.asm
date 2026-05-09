; DESCRIPTION: Draws a magenta line from (298, 144) to (97, 40).
; PLAN: r0=298(x1), r1=144(y1), r2=97(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 144
LDI r2, 97
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
