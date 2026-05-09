; DESCRIPTION: Places a green line segment connecting (150, 127) to (413, 68).
; PLAN: r0=150(x1), r1=127(y1), r2=413(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 127
LDI r2, 413
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
