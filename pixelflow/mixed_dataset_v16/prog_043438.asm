; DESCRIPTION: Renders a green line between points (366, 157) and (225, 50).
; PLAN: r0=366(x1), r1=157(y1), r2=225(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 157
LDI r2, 225
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
