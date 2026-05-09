; DESCRIPTION: Places a green line segment connecting (394, 121) to (236, 65).
; PLAN: r0=394(x1), r1=121(y1), r2=236(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 121
LDI r2, 236
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
