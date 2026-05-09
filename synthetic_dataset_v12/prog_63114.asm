; DESCRIPTION: Places a yellow line segment connecting (470, 25) to (487, 226).
; PLAN: r0=470(x1), r1=25(y1), r2=487(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 25
LDI r2, 487
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
