; DESCRIPTION: Renders a cyan line between points (123, 73) and (146, 180).
; PLAN: r0=123(x1), r1=73(y1), r2=146(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 73
LDI r2, 146
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
