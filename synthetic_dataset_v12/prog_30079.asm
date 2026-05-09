; DESCRIPTION: Places a green line segment connecting (382, 236) to (180, 13).
; PLAN: r0=382(x1), r1=236(y1), r2=180(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 236
LDI r2, 180
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
