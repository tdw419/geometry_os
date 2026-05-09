; DESCRIPTION: Renders a cyan line between points (291, 163) and (174, 34).
; PLAN: r0=291(x1), r1=163(y1), r2=174(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 163
LDI r2, 174
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
