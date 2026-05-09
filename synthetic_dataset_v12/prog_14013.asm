; DESCRIPTION: Renders a green line between points (368, 65) and (323, 126).
; PLAN: r0=368(x1), r1=65(y1), r2=323(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 65
LDI r2, 323
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
