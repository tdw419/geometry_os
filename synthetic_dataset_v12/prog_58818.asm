; DESCRIPTION: Renders a green line between points (138, 63) and (196, 218).
; PLAN: r0=138(x1), r1=63(y1), r2=196(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 63
LDI r2, 196
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
