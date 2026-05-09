; DESCRIPTION: Renders a cyan line between points (41, 164) and (454, 137).
; PLAN: r0=41(x1), r1=164(y1), r2=454(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 164
LDI r2, 454
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
