; DESCRIPTION: Renders a yellow line between points (509, 255) and (176, 176).
; PLAN: r0=509(x1), r1=255(y1), r2=176(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 255
LDI r2, 176
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
