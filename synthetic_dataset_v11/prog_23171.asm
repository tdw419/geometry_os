; DESCRIPTION: Renders a cyan line between points (166, 158) and (7, 209).
; PLAN: r0=166(x1), r1=158(y1), r2=7(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 158
LDI r2, 7
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
