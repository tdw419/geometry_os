; DESCRIPTION: Renders a green line between points (149, 194) and (42, 139).
; PLAN: r0=149(x1), r1=194(y1), r2=42(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 194
LDI r2, 42
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
