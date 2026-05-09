; DESCRIPTION: Renders a magenta line between points (293, 251) and (326, 231).
; PLAN: r0=293(x1), r1=251(y1), r2=326(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 251
LDI r2, 326
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
