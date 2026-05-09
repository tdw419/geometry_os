; DESCRIPTION: Renders a cyan line between points (342, 98) and (390, 242).
; PLAN: r0=342(x1), r1=98(y1), r2=390(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 98
LDI r2, 390
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
