; DESCRIPTION: Places a cyan line segment connecting (202, 137) to (221, 221).
; PLAN: r0=202(x1), r1=137(y1), r2=221(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 137
LDI r2, 221
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
