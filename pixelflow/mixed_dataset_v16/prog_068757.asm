; DESCRIPTION: Draws a green line from (326, 80) to (242, 11).
; PLAN: r0=326(x1), r1=80(y1), r2=242(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 80
LDI r2, 242
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
