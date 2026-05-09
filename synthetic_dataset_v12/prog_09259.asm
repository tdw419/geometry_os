; DESCRIPTION: Renders a green line between points (358, 120) and (192, 215).
; PLAN: r0=358(x1), r1=120(y1), r2=192(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 120
LDI r2, 192
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
