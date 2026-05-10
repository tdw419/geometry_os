; DESCRIPTION: Places a yellow line segment connecting (453, 7) to (479, 248).
; PLAN: r0=453(x1), r1=7(y1), r2=479(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 7
LDI r2, 479
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
