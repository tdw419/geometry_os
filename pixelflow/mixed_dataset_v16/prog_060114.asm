; DESCRIPTION: Places a green line segment connecting (197, 97) to (315, 57).
; PLAN: r0=197(x1), r1=97(y1), r2=315(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 97
LDI r2, 315
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
