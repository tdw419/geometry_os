; DESCRIPTION: Renders a cyan line between points (86, 47) and (176, 55).
; PLAN: r0=86(x1), r1=47(y1), r2=176(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 47
LDI r2, 176
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
