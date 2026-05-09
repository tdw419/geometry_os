; DESCRIPTION: Draws a green line from (287, 46) to (27, 130).
; PLAN: r0=287(x1), r1=46(y1), r2=27(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 46
LDI r2, 27
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
