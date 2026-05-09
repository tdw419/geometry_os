; DESCRIPTION: Places a magenta line segment connecting (175, 231) to (9, 143).
; PLAN: r0=175(x1), r1=231(y1), r2=9(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 231
LDI r2, 9
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
