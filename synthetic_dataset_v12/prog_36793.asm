; DESCRIPTION: Renders a white line between points (326, 127) and (330, 207).
; PLAN: r0=326(x1), r1=127(y1), r2=330(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 127
LDI r2, 330
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
