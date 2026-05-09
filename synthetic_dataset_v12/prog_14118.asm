; DESCRIPTION: Renders a cyan line between points (55, 30) and (370, 177).
; PLAN: r0=55(x1), r1=30(y1), r2=370(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 30
LDI r2, 370
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
