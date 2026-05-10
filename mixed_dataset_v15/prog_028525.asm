; DESCRIPTION: Renders a cyan line between points (363, 93) and (121, 167).
; PLAN: r0=363(x1), r1=93(y1), r2=121(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 93
LDI r2, 121
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
