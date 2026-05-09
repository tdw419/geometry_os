; DESCRIPTION: Renders a cyan line between points (103, 80) and (55, 225).
; PLAN: r0=103(x1), r1=80(y1), r2=55(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 80
LDI r2, 55
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
