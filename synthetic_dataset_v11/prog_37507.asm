; DESCRIPTION: Renders a cyan line between points (250, 84) and (87, 48).
; PLAN: r0=250(x1), r1=84(y1), r2=87(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 84
LDI r2, 87
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
