; DESCRIPTION: Renders a green line between points (240, 58) and (82, 190).
; PLAN: r0=240(x1), r1=58(y1), r2=82(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 58
LDI r2, 82
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
