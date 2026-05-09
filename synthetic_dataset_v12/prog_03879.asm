; DESCRIPTION: Renders a cyan line between points (492, 217) and (264, 71).
; PLAN: r0=492(x1), r1=217(y1), r2=264(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 217
LDI r2, 264
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
