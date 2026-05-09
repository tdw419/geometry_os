; DESCRIPTION: Renders a green line between points (223, 205) and (146, 194).
; PLAN: r0=223(x1), r1=205(y1), r2=146(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 205
LDI r2, 146
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
