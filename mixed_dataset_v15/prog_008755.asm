; DESCRIPTION: Renders a cyan line between points (439, 241) and (504, 122).
; PLAN: r0=439(x1), r1=241(y1), r2=504(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 241
LDI r2, 504
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
