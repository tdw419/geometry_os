; DESCRIPTION: Renders a green line between points (239, 216) and (364, 246).
; PLAN: r0=239(x1), r1=216(y1), r2=364(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 216
LDI r2, 364
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
