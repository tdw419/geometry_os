; DESCRIPTION: Places a cyan line segment connecting (72, 241) to (81, 160).
; PLAN: r0=72(x1), r1=241(y1), r2=81(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 241
LDI r2, 81
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
