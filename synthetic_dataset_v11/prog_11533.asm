; DESCRIPTION: Places a cyan line segment connecting (231, 98) to (91, 168).
; PLAN: r0=231(x1), r1=98(y1), r2=91(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 98
LDI r2, 91
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
