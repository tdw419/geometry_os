; DESCRIPTION: Places a magenta line segment connecting (479, 99) to (194, 207).
; PLAN: r0=479(x1), r1=99(y1), r2=194(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 99
LDI r2, 194
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
