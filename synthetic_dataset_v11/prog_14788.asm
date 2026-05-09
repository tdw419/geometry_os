; DESCRIPTION: Places a cyan line segment connecting (248, 189) to (206, 91).
; PLAN: r0=248(x1), r1=189(y1), r2=206(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 189
LDI r2, 206
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
