; DESCRIPTION: Renders a white line between points (31, 144) and (236, 231).
; PLAN: r0=31(x1), r1=144(y1), r2=236(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 144
LDI r2, 236
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
