; DESCRIPTION: Composite: . Then Renders a cyan disk with center (110, 101) and radius 47. Then Renders a cyan line between points (221, 109) and (22, 0).
; PLAN: r0=110(x), r1=101(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=221(x1), r1=109(y1), r2=22(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (110, 101) and radius 47.
; PLAN: r0=110(x), r1=101(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 101
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan line between points (221, 109) and (22, 0).
; PLAN: r0=221(x1), r1=109(y1), r2=22(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 109
LDI r2, 22
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
