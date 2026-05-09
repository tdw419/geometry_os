; DESCRIPTION: Renders a cyan line between points (355, 61) and (264, 241).
; PLAN: r0=355(x1), r1=61(y1), r2=264(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 61
LDI r2, 264
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
