; DESCRIPTION: Renders a yellow line between points (392, 98) and (236, 60).
; PLAN: r0=392(x1), r1=98(y1), r2=236(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 98
LDI r2, 236
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
