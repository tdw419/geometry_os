; DESCRIPTION: Renders a green line between points (470, 111) and (144, 252).
; PLAN: r0=470(x1), r1=111(y1), r2=144(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 111
LDI r2, 144
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
