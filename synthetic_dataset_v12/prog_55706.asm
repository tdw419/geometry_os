; DESCRIPTION: Renders a yellow line between points (175, 162) and (210, 208).
; PLAN: r0=175(x1), r1=162(y1), r2=210(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 162
LDI r2, 210
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
