; DESCRIPTION: Renders a green line between points (132, 213) and (157, 41).
; PLAN: r0=132(x1), r1=213(y1), r2=157(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 213
LDI r2, 157
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
