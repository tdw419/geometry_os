; DESCRIPTION: Renders a cyan line between points (277, 212) and (399, 41).
; PLAN: r0=277(x1), r1=212(y1), r2=399(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 212
LDI r2, 399
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
