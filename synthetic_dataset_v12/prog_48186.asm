; DESCRIPTION: Draws a cyan line from (441, 250) to (56, 137).
; PLAN: r0=441(x1), r1=250(y1), r2=56(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 250
LDI r2, 56
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
