; DESCRIPTION: Renders a cyan line between points (167, 241) and (233, 49).
; PLAN: r0=167(x1), r1=241(y1), r2=233(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 241
LDI r2, 233
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
