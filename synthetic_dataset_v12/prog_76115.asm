; DESCRIPTION: Places a yellow line segment connecting (487, 230) to (57, 46).
; PLAN: r0=487(x1), r1=230(y1), r2=57(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 230
LDI r2, 57
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
