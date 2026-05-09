; DESCRIPTION: Renders a cyan line between points (93, 65) and (229, 242).
; PLAN: r0=93(x1), r1=65(y1), r2=229(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 65
LDI r2, 229
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
