; DESCRIPTION: Renders a cyan line between points (279, 71) and (349, 34).
; PLAN: r0=279(x1), r1=71(y1), r2=349(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 71
LDI r2, 349
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
