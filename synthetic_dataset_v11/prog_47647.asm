; DESCRIPTION: Places a green line segment connecting (107, 255) to (60, 57).
; PLAN: r0=107(x1), r1=255(y1), r2=60(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 255
LDI r2, 60
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
