; DESCRIPTION: Renders a cyan line between points (148, 24) and (236, 18).
; PLAN: r0=148(x1), r1=24(y1), r2=236(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 24
LDI r2, 236
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
