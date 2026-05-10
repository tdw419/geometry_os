; DESCRIPTION: Renders a cyan line between points (95, 244) and (197, 141).
; PLAN: r0=95(x1), r1=244(y1), r2=197(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 244
LDI r2, 197
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
