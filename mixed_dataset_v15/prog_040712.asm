; DESCRIPTION: Renders a cyan line between points (51, 155) and (239, 197).
; PLAN: r0=51(x1), r1=155(y1), r2=239(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 155
LDI r2, 239
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
