; DESCRIPTION: Renders a green line between points (27, 117) and (57, 140).
; PLAN: r0=27(x1), r1=117(y1), r2=57(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 117
LDI r2, 57
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
