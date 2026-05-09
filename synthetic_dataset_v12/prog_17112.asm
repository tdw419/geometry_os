; DESCRIPTION: Renders a white line between points (417, 188) and (465, 43).
; PLAN: r0=417(x1), r1=188(y1), r2=465(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 188
LDI r2, 465
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
