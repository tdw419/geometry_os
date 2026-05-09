; DESCRIPTION: Renders a yellow line between points (243, 6) and (173, 229).
; PLAN: r0=243(x1), r1=6(y1), r2=173(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 6
LDI r2, 173
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
