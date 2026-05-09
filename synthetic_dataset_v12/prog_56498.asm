; DESCRIPTION: Renders a cyan line between points (101, 193) and (388, 91).
; PLAN: r0=101(x1), r1=193(y1), r2=388(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 193
LDI r2, 388
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
