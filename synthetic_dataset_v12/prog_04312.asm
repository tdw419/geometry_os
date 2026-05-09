; DESCRIPTION: Places a red line segment connecting (166, 231) to (114, 46).
; PLAN: r0=166(x1), r1=231(y1), r2=114(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 231
LDI r2, 114
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
