; DESCRIPTION: Renders a cyan line between points (445, 158) and (177, 52).
; PLAN: r0=445(x1), r1=158(y1), r2=177(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 158
LDI r2, 177
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
