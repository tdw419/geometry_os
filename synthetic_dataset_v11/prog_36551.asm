; DESCRIPTION: Renders a cyan line between points (202, 144) and (170, 194).
; PLAN: r0=202(x1), r1=144(y1), r2=170(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 144
LDI r2, 170
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
