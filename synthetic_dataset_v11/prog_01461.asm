; DESCRIPTION: Renders a cyan line between points (131, 73) and (14, 221).
; PLAN: r0=131(x1), r1=73(y1), r2=14(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 73
LDI r2, 14
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
