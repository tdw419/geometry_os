; DESCRIPTION: Draws a cyan line from (33, 250) to (357, 232).
; PLAN: r0=33(x1), r1=250(y1), r2=357(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 250
LDI r2, 357
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
