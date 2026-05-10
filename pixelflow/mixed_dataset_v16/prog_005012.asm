; DESCRIPTION: Draws a green line from (124, 27) to (26, 160).
; PLAN: r0=124(x1), r1=27(y1), r2=26(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 27
LDI r2, 26
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
