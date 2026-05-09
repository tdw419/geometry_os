; DESCRIPTION: Renders a cyan line between points (385, 195) and (142, 0).
; PLAN: r0=385(x1), r1=195(y1), r2=142(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 195
LDI r2, 142
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
