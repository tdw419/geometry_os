; DESCRIPTION: Renders a green line between points (61, 161) and (398, 130).
; PLAN: r0=61(x1), r1=161(y1), r2=398(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 161
LDI r2, 398
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
