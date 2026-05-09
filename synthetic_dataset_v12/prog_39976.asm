; DESCRIPTION: Renders a cyan line between points (148, 48) and (475, 157).
; PLAN: r0=148(x1), r1=48(y1), r2=475(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 48
LDI r2, 475
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
