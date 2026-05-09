; DESCRIPTION: Renders a yellow line between points (394, 255) and (325, 192).
; PLAN: r0=394(x1), r1=255(y1), r2=325(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 255
LDI r2, 325
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
