; DESCRIPTION: Renders a cyan line between points (162, 131) and (123, 135).
; PLAN: r0=162(x1), r1=131(y1), r2=123(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 131
LDI r2, 123
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
