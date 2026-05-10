; DESCRIPTION: Renders a cyan line between points (333, 18) and (112, 159).
; PLAN: r0=333(x1), r1=18(y1), r2=112(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 18
LDI r2, 112
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
