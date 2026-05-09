; DESCRIPTION: Renders a green line between points (172, 208) and (499, 31).
; PLAN: r0=172(x1), r1=208(y1), r2=499(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 208
LDI r2, 499
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
