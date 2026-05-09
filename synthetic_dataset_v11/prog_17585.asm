; DESCRIPTION: Renders a cyan line between points (202, 227) and (4, 60).
; PLAN: r0=202(x1), r1=227(y1), r2=4(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 227
LDI r2, 4
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
