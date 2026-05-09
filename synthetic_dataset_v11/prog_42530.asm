; DESCRIPTION: Renders a cyan line between points (131, 54) and (208, 102).
; PLAN: r0=131(x1), r1=54(y1), r2=208(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 54
LDI r2, 208
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
