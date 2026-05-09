; DESCRIPTION: Renders a cyan line between points (27, 245) and (186, 100).
; PLAN: r0=27(x1), r1=245(y1), r2=186(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 245
LDI r2, 186
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
