; DESCRIPTION: Renders a white line between points (264, 188) and (326, 70).
; PLAN: r0=264(x1), r1=188(y1), r2=326(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 188
LDI r2, 326
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
