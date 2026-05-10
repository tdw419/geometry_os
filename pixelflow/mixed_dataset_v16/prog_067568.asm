; DESCRIPTION: Places a cyan line segment connecting (337, 26) to (394, 155).
; PLAN: r0=337(x1), r1=26(y1), r2=394(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 26
LDI r2, 394
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
