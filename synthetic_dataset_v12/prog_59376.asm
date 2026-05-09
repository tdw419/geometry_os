; DESCRIPTION: Renders a cyan line between points (336, 142) and (63, 1).
; PLAN: r0=336(x1), r1=142(y1), r2=63(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 142
LDI r2, 63
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
