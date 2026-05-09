; DESCRIPTION: Draws a magenta line from (281, 252) to (240, 40).
; PLAN: r0=281(x1), r1=252(y1), r2=240(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 252
LDI r2, 240
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
