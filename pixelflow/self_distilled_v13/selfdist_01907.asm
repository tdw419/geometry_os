; DESCRIPTION: Renders a cyan line segment connecting (260, 49) to (378, 46).
; PLAN: r0=260(x1), r1=49(y1), r2=378(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 49
LDI r2, 378
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
