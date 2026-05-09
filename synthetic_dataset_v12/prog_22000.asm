; DESCRIPTION: Renders a cyan line between points (46, 195) and (41, 195).
; PLAN: r0=46(x1), r1=195(y1), r2=41(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 195
LDI r2, 41
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
