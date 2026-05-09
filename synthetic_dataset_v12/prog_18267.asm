; DESCRIPTION: Renders a cyan line between points (435, 21) and (389, 156).
; PLAN: r0=435(x1), r1=21(y1), r2=389(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 21
LDI r2, 389
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
