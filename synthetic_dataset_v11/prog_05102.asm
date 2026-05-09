; DESCRIPTION: Renders a green line between points (152, 91) and (142, 173).
; PLAN: r0=152(x1), r1=91(y1), r2=142(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 91
LDI r2, 142
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
