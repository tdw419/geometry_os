; DESCRIPTION: Renders a cyan line between points (460, 136) and (506, 41).
; PLAN: r0=460(x1), r1=136(y1), r2=506(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 136
LDI r2, 506
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
