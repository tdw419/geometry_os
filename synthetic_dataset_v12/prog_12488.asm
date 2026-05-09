; DESCRIPTION: Places a cyan line segment connecting (509, 187) to (129, 82).
; PLAN: r0=509(x1), r1=187(y1), r2=129(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 187
LDI r2, 129
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
