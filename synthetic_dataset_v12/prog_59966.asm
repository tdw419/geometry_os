; DESCRIPTION: Renders a white line between points (243, 16) and (439, 137).
; PLAN: r0=243(x1), r1=16(y1), r2=439(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 16
LDI r2, 439
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
