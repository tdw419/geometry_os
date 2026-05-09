; DESCRIPTION: Draws a cyan line from (52, 241) to (357, 65).
; PLAN: r0=52(x1), r1=241(y1), r2=357(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 241
LDI r2, 357
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
