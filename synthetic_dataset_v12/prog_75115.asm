; DESCRIPTION: Places a cyan line segment connecting (394, 103) to (432, 112).
; PLAN: r0=394(x1), r1=103(y1), r2=432(x2), r3=112(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 103
LDI r2, 432
LDI r3, 112
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
