; DESCRIPTION: Renders a green line between points (329, 57) and (355, 142).
; PLAN: r0=329(x1), r1=57(y1), r2=355(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 57
LDI r2, 355
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
