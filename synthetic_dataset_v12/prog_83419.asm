; DESCRIPTION: Renders a green line between points (37, 225) and (499, 249).
; PLAN: r0=37(x1), r1=225(y1), r2=499(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 225
LDI r2, 499
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
