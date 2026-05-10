; DESCRIPTION: Renders a cyan line between points (376, 16) and (436, 119).
; PLAN: r0=376(x1), r1=16(y1), r2=436(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 16
LDI r2, 436
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
