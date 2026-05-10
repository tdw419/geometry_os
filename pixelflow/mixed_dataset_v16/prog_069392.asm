; DESCRIPTION: Renders a green line between points (324, 199) and (326, 87).
; PLAN: r0=324(x1), r1=199(y1), r2=326(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 199
LDI r2, 326
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
