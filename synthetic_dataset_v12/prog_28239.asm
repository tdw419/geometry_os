; DESCRIPTION: Renders a green line between points (392, 40) and (131, 8).
; PLAN: r0=392(x1), r1=40(y1), r2=131(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 40
LDI r2, 131
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
