; DESCRIPTION: Renders a green line between points (150, 124) and (229, 196).
; PLAN: r0=150(x1), r1=124(y1), r2=229(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 124
LDI r2, 229
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
