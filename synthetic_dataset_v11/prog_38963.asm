; DESCRIPTION: Places a cyan line segment connecting (57, 243) to (144, 149).
; PLAN: r0=57(x1), r1=243(y1), r2=144(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 243
LDI r2, 144
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
