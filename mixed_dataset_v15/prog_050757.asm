; DESCRIPTION: Renders a cyan line between points (58, 14) and (130, 180).
; PLAN: r0=58(x1), r1=14(y1), r2=130(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 14
LDI r2, 130
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
