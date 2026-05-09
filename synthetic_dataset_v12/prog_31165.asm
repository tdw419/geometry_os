; DESCRIPTION: Renders a white line between points (365, 137) and (344, 156).
; PLAN: r0=365(x1), r1=137(y1), r2=344(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 137
LDI r2, 344
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
