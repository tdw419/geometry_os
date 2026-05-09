; DESCRIPTION: Renders a cyan line between points (6, 186) and (44, 115).
; PLAN: r0=6(x1), r1=186(y1), r2=44(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 186
LDI r2, 44
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
