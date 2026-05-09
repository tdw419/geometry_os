; DESCRIPTION: Renders a green line between points (487, 123) and (206, 142).
; PLAN: r0=487(x1), r1=123(y1), r2=206(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 123
LDI r2, 206
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
