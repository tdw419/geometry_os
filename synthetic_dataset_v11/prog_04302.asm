; DESCRIPTION: Renders a orange line between points (135, 64) and (46, 223).
; PLAN: r0=135(x1), r1=64(y1), r2=46(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 64
LDI r2, 46
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
