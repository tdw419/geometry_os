; DESCRIPTION: Renders a cyan line between points (17, 91) and (368, 197).
; PLAN: r0=17(x1), r1=91(y1), r2=368(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 91
LDI r2, 368
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
