; DESCRIPTION: Renders a green line between points (102, 254) and (32, 240).
; PLAN: r0=102(x1), r1=254(y1), r2=32(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 254
LDI r2, 32
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
