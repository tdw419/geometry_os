; DESCRIPTION: Renders a cyan line between points (10, 54) and (114, 180).
; PLAN: r0=10(x1), r1=54(y1), r2=114(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 54
LDI r2, 114
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
