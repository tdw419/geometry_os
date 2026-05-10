; DESCRIPTION: Renders a cyan line between points (138, 146) and (146, 123).
; PLAN: r0=138(x1), r1=146(y1), r2=146(x2), r3=123(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 146
LDI r2, 146
LDI r3, 123
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
