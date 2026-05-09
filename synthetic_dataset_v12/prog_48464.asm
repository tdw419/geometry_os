; DESCRIPTION: Renders a cyan line between points (453, 160) and (287, 18).
; PLAN: r0=453(x1), r1=160(y1), r2=287(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 160
LDI r2, 287
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
