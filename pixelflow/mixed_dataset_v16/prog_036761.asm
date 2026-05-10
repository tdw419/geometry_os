; DESCRIPTION: Places a magenta line segment connecting (345, 204) to (284, 130).
; PLAN: r0=345(x1), r1=204(y1), r2=284(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 204
LDI r2, 284
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
