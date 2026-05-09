; DESCRIPTION: Renders a green line between points (417, 27) and (323, 132).
; PLAN: r0=417(x1), r1=27(y1), r2=323(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 27
LDI r2, 323
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
