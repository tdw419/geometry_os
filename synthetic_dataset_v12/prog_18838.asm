; DESCRIPTION: Renders a cyan line between points (305, 131) and (508, 190).
; PLAN: r0=305(x1), r1=131(y1), r2=508(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 131
LDI r2, 508
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
