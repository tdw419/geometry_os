; DESCRIPTION: Renders a green line between points (470, 56) and (280, 218).
; PLAN: r0=470(x1), r1=56(y1), r2=280(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 56
LDI r2, 280
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
