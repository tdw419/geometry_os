; DESCRIPTION: Places a yellow line segment connecting (367, 180) to (487, 28).
; PLAN: r0=367(x1), r1=180(y1), r2=487(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 180
LDI r2, 487
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
