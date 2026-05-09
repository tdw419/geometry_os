; DESCRIPTION: Renders a green line between points (458, 152) and (471, 70).
; PLAN: r0=458(x1), r1=152(y1), r2=471(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 152
LDI r2, 471
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
