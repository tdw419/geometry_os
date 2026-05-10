; DESCRIPTION: Renders a cyan line between points (102, 74) and (160, 170).
; PLAN: r0=102(x1), r1=74(y1), r2=160(x2), r3=170(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 74
LDI r2, 160
LDI r3, 170
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
