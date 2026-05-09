; DESCRIPTION: Renders a green line between points (87, 187) and (345, 190).
; PLAN: r0=87(x1), r1=187(y1), r2=345(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 187
LDI r2, 345
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
