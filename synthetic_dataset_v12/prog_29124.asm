; DESCRIPTION: Renders a yellow line between points (180, 31) and (35, 83).
; PLAN: r0=180(x1), r1=31(y1), r2=35(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 31
LDI r2, 35
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
