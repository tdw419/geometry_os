; DESCRIPTION: Renders a yellow line between points (239, 243) and (159, 197).
; PLAN: r0=239(x1), r1=243(y1), r2=159(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 243
LDI r2, 159
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
