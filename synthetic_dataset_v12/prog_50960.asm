; DESCRIPTION: Renders a cyan line between points (52, 153) and (509, 75).
; PLAN: r0=52(x1), r1=153(y1), r2=509(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 153
LDI r2, 509
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
