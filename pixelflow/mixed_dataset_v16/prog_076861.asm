; DESCRIPTION: Renders a cyan line between points (73, 169) and (320, 115).
; PLAN: r0=73(x1), r1=169(y1), r2=320(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 169
LDI r2, 320
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
