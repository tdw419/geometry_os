; DESCRIPTION: Draws a green line from (54, 195) to (309, 131).
; PLAN: r0=54(x1), r1=195(y1), r2=309(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 195
LDI r2, 309
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
