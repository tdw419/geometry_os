; DESCRIPTION: Renders a magenta line between points (406, 143) and (484, 195).
; PLAN: r0=406(x1), r1=143(y1), r2=484(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 143
LDI r2, 484
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
