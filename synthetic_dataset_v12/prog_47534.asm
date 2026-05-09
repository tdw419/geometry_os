; DESCRIPTION: Renders a cyan line between points (314, 226) and (410, 226).
; PLAN: r0=314(x1), r1=226(y1), r2=410(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 226
LDI r2, 410
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
