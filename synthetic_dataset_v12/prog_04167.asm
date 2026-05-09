; DESCRIPTION: Renders a green line between points (329, 255) and (249, 126).
; PLAN: r0=329(x1), r1=255(y1), r2=249(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 255
LDI r2, 249
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
