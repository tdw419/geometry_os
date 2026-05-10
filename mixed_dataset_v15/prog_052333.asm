; DESCRIPTION: Renders a green line between points (162, 31) and (480, 188).
; PLAN: r0=162(x1), r1=31(y1), r2=480(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 31
LDI r2, 480
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
