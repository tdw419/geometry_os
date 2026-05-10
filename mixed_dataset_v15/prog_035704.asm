; DESCRIPTION: Places a green line segment connecting (276, 202) to (113, 84).
; PLAN: r0=276(x1), r1=202(y1), r2=113(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 202
LDI r2, 113
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
