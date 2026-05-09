; DESCRIPTION: Renders a cyan line between points (260, 25) and (500, 94).
; PLAN: r0=260(x1), r1=25(y1), r2=500(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 25
LDI r2, 500
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
