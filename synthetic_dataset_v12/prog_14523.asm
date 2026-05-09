; DESCRIPTION: Renders a red line between points (433, 128) and (438, 192).
; PLAN: r0=433(x1), r1=128(y1), r2=438(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 128
LDI r2, 438
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
