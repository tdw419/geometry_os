; DESCRIPTION: Renders a cyan line between points (35, 184) and (260, 196).
; PLAN: r0=35(x1), r1=184(y1), r2=260(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 184
LDI r2, 260
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
