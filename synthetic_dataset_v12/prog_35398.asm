; DESCRIPTION: Renders a green line between points (199, 70) and (21, 253).
; PLAN: r0=199(x1), r1=70(y1), r2=21(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 70
LDI r2, 21
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
