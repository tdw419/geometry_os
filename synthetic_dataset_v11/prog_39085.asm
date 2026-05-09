; DESCRIPTION: Renders a cyan line between points (103, 190) and (130, 160).
; PLAN: r0=103(x1), r1=190(y1), r2=130(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 190
LDI r2, 130
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
