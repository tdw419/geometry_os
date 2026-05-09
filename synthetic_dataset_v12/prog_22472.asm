; DESCRIPTION: Renders a yellow line between points (371, 180) and (146, 33).
; PLAN: r0=371(x1), r1=180(y1), r2=146(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 180
LDI r2, 146
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
