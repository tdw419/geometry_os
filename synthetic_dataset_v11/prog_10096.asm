; DESCRIPTION: Renders a cyan line between points (18, 190) and (58, 111).
; PLAN: r0=18(x1), r1=190(y1), r2=58(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 190
LDI r2, 58
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
