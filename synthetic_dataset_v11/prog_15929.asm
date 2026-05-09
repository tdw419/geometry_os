; DESCRIPTION: Renders a green line between points (243, 241) and (162, 108).
; PLAN: r0=243(x1), r1=241(y1), r2=162(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 241
LDI r2, 162
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
