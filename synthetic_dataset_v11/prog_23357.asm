; DESCRIPTION: Places a cyan line segment connecting (121, 47) to (192, 234).
; PLAN: r0=121(x1), r1=47(y1), r2=192(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 47
LDI r2, 192
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
