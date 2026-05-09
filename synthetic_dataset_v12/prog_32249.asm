; DESCRIPTION: Renders a cyan line between points (363, 72) and (9, 115).
; PLAN: r0=363(x1), r1=72(y1), r2=9(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 72
LDI r2, 9
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
