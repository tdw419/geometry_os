; DESCRIPTION: Renders a cyan line between points (237, 66) and (339, 240).
; PLAN: r0=237(x1), r1=66(y1), r2=339(x2), r3=240(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 66
LDI r2, 339
LDI r3, 240
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
