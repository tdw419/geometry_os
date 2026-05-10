; DESCRIPTION: Places a cyan line segment connecting (202, 36) to (469, 58).
; PLAN: r0=202(x1), r1=36(y1), r2=469(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 36
LDI r2, 469
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
