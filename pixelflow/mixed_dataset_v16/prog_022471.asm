; DESCRIPTION: Places a cyan line segment connecting (433, 138) to (406, 163).
; PLAN: r0=433(x1), r1=138(y1), r2=406(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 138
LDI r2, 406
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
