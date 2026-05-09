; DESCRIPTION: Places a cyan line segment connecting (138, 58) to (123, 233).
; PLAN: r0=138(x1), r1=58(y1), r2=123(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 58
LDI r2, 123
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
