; DESCRIPTION: Places a cyan line segment connecting (379, 141) to (227, 223).
; PLAN: r0=379(x1), r1=141(y1), r2=227(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 141
LDI r2, 227
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
