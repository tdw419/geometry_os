; DESCRIPTION: Renders a cyan line between points (503, 190) and (365, 46).
; PLAN: r0=503(x1), r1=190(y1), r2=365(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 190
LDI r2, 365
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
