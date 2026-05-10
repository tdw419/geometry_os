; DESCRIPTION: Renders a green line between points (225, 120) and (352, 46).
; PLAN: r0=225(x1), r1=120(y1), r2=352(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 120
LDI r2, 352
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
