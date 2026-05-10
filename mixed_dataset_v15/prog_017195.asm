; DESCRIPTION: Renders a cyan line between points (436, 245) and (484, 0).
; PLAN: r0=436(x1), r1=245(y1), r2=484(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 245
LDI r2, 484
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
