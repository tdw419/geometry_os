; DESCRIPTION: Places a cyan line segment connecting (130, 25) to (172, 148).
; PLAN: r0=130(x1), r1=25(y1), r2=172(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 25
LDI r2, 172
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
