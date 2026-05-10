; DESCRIPTION: Places a yellow line segment connecting (60, 202) to (394, 250).
; PLAN: r0=60(x1), r1=202(y1), r2=394(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 202
LDI r2, 394
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
