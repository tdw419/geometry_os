; DESCRIPTION: Renders a cyan line between points (81, 212) and (211, 222).
; PLAN: r0=81(x1), r1=212(y1), r2=211(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 212
LDI r2, 211
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
