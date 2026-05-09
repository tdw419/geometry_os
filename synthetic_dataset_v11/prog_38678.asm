; DESCRIPTION: Places a cyan line segment connecting (198, 13) to (26, 86).
; PLAN: r0=198(x1), r1=13(y1), r2=26(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 13
LDI r2, 26
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
