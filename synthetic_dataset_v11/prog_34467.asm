; DESCRIPTION: Renders a cyan line between points (208, 49) and (146, 110).
; PLAN: r0=208(x1), r1=49(y1), r2=146(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 49
LDI r2, 146
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
