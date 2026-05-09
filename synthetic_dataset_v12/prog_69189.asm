; DESCRIPTION: Renders a yellow line between points (363, 126) and (39, 231).
; PLAN: r0=363(x1), r1=126(y1), r2=39(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 126
LDI r2, 39
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
