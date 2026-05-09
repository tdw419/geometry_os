; DESCRIPTION: Renders a cyan line between points (114, 162) and (187, 49).
; PLAN: r0=114(x1), r1=162(y1), r2=187(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 162
LDI r2, 187
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
