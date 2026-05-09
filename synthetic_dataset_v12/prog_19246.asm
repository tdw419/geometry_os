; DESCRIPTION: Places a green line segment connecting (59, 91) to (408, 127).
; PLAN: r0=59(x1), r1=91(y1), r2=408(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 91
LDI r2, 408
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
