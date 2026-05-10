; DESCRIPTION: Draws a green line from (406, 187) to (453, 13).
; PLAN: r0=406(x1), r1=187(y1), r2=453(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 187
LDI r2, 453
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
