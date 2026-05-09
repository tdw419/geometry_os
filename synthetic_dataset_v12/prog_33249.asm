; DESCRIPTION: Renders a green line between points (151, 120) and (328, 41).
; PLAN: r0=151(x1), r1=120(y1), r2=328(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 120
LDI r2, 328
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
