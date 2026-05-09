; DESCRIPTION: Places a cyan line segment connecting (231, 129) to (398, 248).
; PLAN: r0=231(x1), r1=129(y1), r2=398(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 129
LDI r2, 398
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
