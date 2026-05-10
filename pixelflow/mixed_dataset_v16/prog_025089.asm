; DESCRIPTION: Places a yellow line segment connecting (319, 54) to (479, 253).
; PLAN: r0=319(x1), r1=54(y1), r2=479(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 54
LDI r2, 479
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
