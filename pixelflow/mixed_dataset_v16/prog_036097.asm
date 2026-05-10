; DESCRIPTION: Renders a white line between points (281, 200) and (345, 108).
; PLAN: r0=281(x1), r1=200(y1), r2=345(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 200
LDI r2, 345
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
