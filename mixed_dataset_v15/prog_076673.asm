; DESCRIPTION: Renders a cyan line between points (165, 247) and (233, 162).
; PLAN: r0=165(x1), r1=247(y1), r2=233(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 247
LDI r2, 233
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
