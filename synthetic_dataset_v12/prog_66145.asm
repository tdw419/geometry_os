; DESCRIPTION: Renders a cyan line between points (480, 190) and (221, 223).
; PLAN: r0=480(x1), r1=190(y1), r2=221(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 190
LDI r2, 221
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
