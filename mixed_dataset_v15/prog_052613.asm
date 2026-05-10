; DESCRIPTION: Renders a yellow line between points (270, 197) and (499, 186).
; PLAN: r0=270(x1), r1=197(y1), r2=499(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 197
LDI r2, 499
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
