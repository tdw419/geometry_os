; DESCRIPTION: Renders a green line between points (110, 21) and (371, 86).
; PLAN: r0=110(x1), r1=21(y1), r2=371(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 21
LDI r2, 371
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
