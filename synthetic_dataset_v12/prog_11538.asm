; DESCRIPTION: Renders a yellow line between points (386, 207) and (135, 193).
; PLAN: r0=386(x1), r1=207(y1), r2=135(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 207
LDI r2, 135
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
