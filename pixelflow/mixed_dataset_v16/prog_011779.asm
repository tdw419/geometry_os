; DESCRIPTION: Renders a cyan line between points (294, 80) and (188, 114).
; PLAN: r0=294(x1), r1=80(y1), r2=188(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 80
LDI r2, 188
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
