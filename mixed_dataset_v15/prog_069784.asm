; DESCRIPTION: Places a green line segment connecting (433, 153) to (295, 46).
; PLAN: r0=433(x1), r1=153(y1), r2=295(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 153
LDI r2, 295
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
