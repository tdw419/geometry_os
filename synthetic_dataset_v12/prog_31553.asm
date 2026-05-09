; DESCRIPTION: Draws a cyan line from (347, 86) to (453, 34).
; PLAN: r0=347(x1), r1=86(y1), r2=453(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 86
LDI r2, 453
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
